// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/view/Widgets/Dialogs/change_admin_info_dialog.dart';
import 'package:medical/view/add_department.dart';
import 'package:medical/view/add_doctors_screen.dart';
import 'package:medical/view/review_feedback_screen.dart';
import 'package:medical/view/view_department_screen.dart';
import 'package:medical/view/view_doctors_screen.dart';
import 'package:medical/viewModel/app_provider.dart';
import 'package:provider/provider.dart';

import '../Core/constants/asset_manager.dart';
import '../Core/translations/locale_keys.g.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({Key? key}) : super(key: key);

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  @override
  void dispose() {
    context.read<AppProvider>().passController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetManager.admin),
              ),
              title: Text(LocaleKeys.adminPanel.tr(),
                  style: Theme.of(context).primaryTextTheme.headline1),
              centerTitle: false,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: 250.h,
          ),
          SliverFillRemaining(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 10 / 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              children: [
                PanelWidget(
                    controllImg: AssetManager.home,
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ViewDepartmentScreen(),
                      ));
                    },
                    controllTitle: LocaleKeys.departments.tr()),
                PanelWidget(
                    controllImg: AssetManager.scan,
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ViewDoctorsScreen(),
                      ));
                    },
                    controllTitle: LocaleKeys.doctors.tr()),
                PanelWidget(
                    controllImg: AssetManager.calendar,
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ReviewFeedBackScreen(),
                      ));
                    },
                    controllTitle: LocaleKeys.reviewFeedBack.tr()),
                PanelWidget(
                    controllImg: AssetManager.setting,
                    ontap: () => changeAdminInfoDialog(
                        context, context.read<AppProvider>()),
                    controllTitle: LocaleKeys.adminInfo.tr()),
                PanelWidget(
                    controllImg: AssetManager.folder,
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddDepartmentScreen(),
                      ));
                    },
                    controllTitle: LocaleKeys.addDepartment.tr()),
                PanelWidget(
                    controllImg: AssetManager.users,
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddDoctorsScreen(),
                      ));
                    },
                    controllTitle: LocaleKeys.addDoctor.tr()),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class PanelWidget extends StatelessWidget {
  final String controllImg;
  final String controllTitle;
  final VoidCallback ontap;
  const PanelWidget({
    Key? key,
    required this.controllImg,
    required this.controllTitle,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        elevation: 5,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                controllImg,
                width: 100.w,
                height: 100.h,
              ),
              Text(
                controllTitle,
                style: Theme.of(context).primaryTextTheme.headline6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
