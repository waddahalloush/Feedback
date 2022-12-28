import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/Core/translations/locale_keys.g.dart';
import 'package:medical/Core/utils/media_query_ex.dart';
import 'package:medical/Core/utils/shimmer_widget.dart';
import 'package:medical/view/Widgets/Dialogs/update_doctor_dialog.dart';
import 'package:medical/view/add_doctors_screen.dart';
import 'package:medical/viewModel/view_doctors_provider.dart';
import 'package:provider/provider.dart';

import '../Core/constants/asset_manager.dart';

class ViewDoctorsScreen extends StatefulWidget {
  const ViewDoctorsScreen({super.key});

  @override
  State<ViewDoctorsScreen> createState() => _ViewDoctorsScreenState();
}

class _ViewDoctorsScreenState extends State<ViewDoctorsScreen> {
  TextEditingController doctorController = TextEditingController();
  @override
  void initState() {
    context.read<ViewDoctorsProvider>().fitchDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewDoctorsProvider>(
      builder: (context, prov, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(

                floating: true,
                pinned: true,
                 actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddDoctorsScreen(),
                            ));
                      },
                      child: const Icon(Icons.add),
                    ),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(AssetManager.doctors),
                  ),
                  title: Text(LocaleKeys.centerDoctors.tr(),
                      style: Theme.of(context).primaryTextTheme.headline1),
                  centerTitle: false,
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 200.h,
              ),
              SliverFillRemaining(
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ConditionalBuilder(
                        condition: prov.isLoading,
                        builder: (context) => ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) =>
                              ShimmerWidget.rectangular(
                                  width: context.width,
                                  height: 150,
                                  radius: 15),
                        ),
                        fallback: (context) => ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            physics: const BouncingScrollPhysics(),
                            itemCount: prov.doctorsList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  elevation: 5,
                                  child: ListTile(
                                    leading: Image.asset(
                                      AssetManager.doctor,
                                      width: 30,
                                      height: 30,
                                    ),
                                    title: Text(
                                      prov.doctorsList[index]["doc_name"],
                                    ),
                                    subtitle: Text(
                                        prov.doctorsList[index]["department"]),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              prov.deleteDoctor(
                                                  prov.doctorsList[index]
                                                      ["doc_id"],
                                                  index);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              doctorController.text =
                                                  prov.doctorsList[index]
                                                      ["doc_name"];
                                              showUpdateDoctorDialog(
                                                  context,
                                                  doctorController,
                                                  () => prov.updateDoctor(
                                                      doctorController.text,
                                                      prov.doctorsList[index]
                                                          ["doc_id"],
                                                      context));
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.blue,
                                            ))
                                      ],
                                    ),
                                  ));
                            }),
                      )))
            ],
          ),
        );
      },
    );
  }
}
