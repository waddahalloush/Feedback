// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/view/add_department.dart';
import 'package:provider/provider.dart';

import 'package:medical/Core/constants/asset_manager.dart';
import 'package:medical/Core/utils/media_query_ex.dart';
import 'package:medical/Core/utils/shimmer_widget.dart';
import 'package:medical/viewModel/view_department_provider.dart';

import '../Core/translations/locale_keys.g.dart';

class ViewDepartmentScreen extends StatefulWidget {
  const ViewDepartmentScreen({super.key});

  @override
  State<ViewDepartmentScreen> createState() => _ViewDepartmentScreenState();
}

class _ViewDepartmentScreenState extends State<ViewDepartmentScreen> {
  @override
  void initState() {
    context.read<ViewDepartmentProvider>().fitchDepartment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewDepartmentProvider>(
      builder: (context, myType, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddDepartmentScreen(),
                            ));
                      },
                      child: const Icon(Icons.add),
                    ),
                  )
                ],
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(AssetManager.dep),
                  title: Text(
                    LocaleKeys.centerDepartment.tr(),
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                  centerTitle: false,
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 300.h,
              ),
              SliverFillRemaining(
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ConditionalBuilder(
                        condition: myType.isLoading,
                        builder: (context) => GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 16 / 9,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20),
                            itemBuilder: (context, index) =>
                                ShimmerWidget.rectangular(
                                  width: context.width / 3,
                                  height: 200,
                                  radius: 5,
                                )),
                        fallback: (context) => GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: myType.departmentList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 16 / 9,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20),
                          itemBuilder: (context, index) => Card(
                              elevation: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Icon(
                                      Icons.add_home_work_sharp,
                                      size: 50.h,
                                      color: Colors.teal,
                                    ),
                                  ),
                                  Text(
                                    myType.departmentList[index]["dep_name"],
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline6,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        myType.deleteDepartment(
                                            myType.departmentList[index]
                                                ["dep_id"],
                                            index);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        size: 50.h,
                                        color: Colors.red,
                                      )),
                                ],
                              )),
                        ),
                      )))
            ],
          ),
        );
      },
    );
  }
}
