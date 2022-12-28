// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:medical/Core/translations/locale_keys.g.dart';
import 'package:medical/viewModel/add_department_provider.dart';

import 'Widgets/confirm_button.dart';

class AddDepartmentScreen extends StatefulWidget {
  const AddDepartmentScreen({Key? key}) : super(key: key);

  @override
  State<AddDepartmentScreen> createState() => _AddDepartmentScreenState();
}

class _AddDepartmentScreenState extends State<AddDepartmentScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddDepartmentProvider>(
      builder: (context, prov, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                titleSpacing: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Lottie.asset("assets/lottie/hos.json"),
                  title: Text(LocaleKeys.addDepartment.tr(),
                      style: Theme.of(context).primaryTextTheme.headline1),
                  centerTitle: false,
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 300.h,
              ),
              // SliverToBoxAdapter(
              //     child: Padding(
              //   padding: const EdgeInsets.all(30.0),
              //   child: Stepper(
              //       physics: const NeverScrollableScrollPhysics(),
              //       elevation: 2,
              //       onStepTapped: (step) => prov.onStepTapped(step),
              //       onStepContinue: () {
              //         prov.onStepContinue(context);
              //       },
              //       onStepCancel: prov.currentStep == 0
              //           ? null
              //           : () => prov.onStepCancle(),
              //       currentStep: prov.currentStep,
              //       steps: prov.getStep()),
              // ))
              SliverToBoxAdapter(
                child: Form(
                  key: prov.fkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.emptyDep.tr();
                            }
                            return null;
                          },
                          controller: prov.depController,
                          decoration: InputDecoration(
                              label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(LocaleKeys.depName.tr()),
                          )),
                        ),
                      ),
                      ConfirmButton(
                        onTap: () => prov.addDepartment(context),
                      ),
                    ],
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

