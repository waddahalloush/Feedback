import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medical/Core/translations/locale_keys.g.dart';
import 'package:medical/Core/utils/media_query_ex.dart';
import 'package:medical/viewModel/add_doctors_provider.dart';
import 'package:provider/provider.dart';

import '../Core/utils/shimmer_widget.dart';
import 'Widgets/confirm_button.dart';

class AddDoctorsScreen extends StatefulWidget {
  const AddDoctorsScreen({Key? key}) : super(key: key);

  @override
  State<AddDoctorsScreen> createState() => _AddDoctorsScreenState();
}

class _AddDoctorsScreenState extends State<AddDoctorsScreen> {
  @override
  void initState() {
    context.read<AddDoctorsProvider>().fitchDepartment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddDoctorsProvider>(
      builder: (context, prov, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                titleSpacing: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Lottie.asset("assets/lottie/care.json"),
                  title: Text(LocaleKeys.addDoctor.tr(),
                      style: Theme.of(context).primaryTextTheme.headline1),
                  centerTitle: false,
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 300.h,
              ),
              SliverToBoxAdapter(
                child: Form(
                  key: prov.fkey,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        ConditionalBuilder(
                          condition: prov.isLoading,
                          builder: (context) => ShimmerWidget.rectangular(
                            width: context.width,
                            height: 50,
                            radius: 12,
                          ),
                          fallback: (context) => DropdownButtonFormField(
                            style: Theme.of(context).primaryTextTheme.headline6,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.emptyDoctor.tr();
                              }
                              return null;
                            },
                            dropdownColor: Colors.white,
                            value: prov.selectedItem,
                            items: prov.departmentList
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (value) => prov.onDropdownchange(value!),
                            decoration: InputDecoration(
                                label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(LocaleKeys.depName.tr()),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.emptyDoctor.tr();
                            }
                            return null;
                          },
                          controller: prov.docController,
                          decoration: InputDecoration(
                              label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(LocaleKeys.doctorName.tr()),
                          )),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ConfirmButton(
                          onTap: () => prov.addDepartmentAndDoctors(context),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
