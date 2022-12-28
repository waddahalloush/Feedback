// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medical/Core/translations/locale_keys.g.dart';
import 'package:medical/view/admin_panel_screen.dart';
import 'package:medical/view/feedback_screen.dart';
import 'package:provider/provider.dart';
import 'package:medical/Core/constants/asset_manager.dart';
import 'package:medical/view/Widgets/Dialogs/verify_dialog.dart';
import 'package:medical/viewModel/app_provider.dart';

import 'Widgets/custom_snackbar.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                EasyLocalization.of(context)!.currentLocale ==
                        const Locale('ar')
                    ? EasyLocalization.of(context)!
                        .setLocale(const Locale('en'))
                    : EasyLocalization.of(context)!
                        .setLocale(const Locale('ar'));
              },
              icon: const Icon(
                Icons.language,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onLongPress: () {
                  var provider = context.read<AppProvider>();

                  showVerifyDialog(context, provider, () {
                    if (provider.isVerified()) {
                      successSnackBar(context, LocaleKeys.canAccess.tr());
                      Future.delayed(const Duration(seconds: 2))
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AdminPanelScreen(),
                              )));
                    } else {
                      errorSnackBar(context, LocaleKeys.cantAccess.tr());
                    }
                  });
                },
                child: Lottie.asset(
                  "assets/lottie/doctor.json",
                  width: 300.w,
                  height: 300.h,
                ),
              ),
              Text(
                LocaleKeys.welcome.tr(),
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                LocaleKeys.welcomeSub.tr(),
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeelingWidget(
                    emojieImg: AssetManager.worst,
                    emojieTitle: LocaleKeys.worst.tr(),
                  ),
                  FeelingWidget(
                    emojieImg: AssetManager.poor,
                    emojieTitle: LocaleKeys.poor.tr(),
                  ),
                  FeelingWidget(
                    emojieImg: AssetManager.average,
                    emojieTitle: LocaleKeys.average.tr(),
                  ),
                  FeelingWidget(
                    emojieImg: AssetManager.good,
                    emojieTitle: LocaleKeys.good.tr(),
                  ),
                  FeelingWidget(
                    emojieImg: AssetManager.excellent,
                    emojieTitle: LocaleKeys.excellent.tr(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FeelingWidget extends StatelessWidget {
  final String emojieImg;
  final String emojieTitle;

  const FeelingWidget({
    Key? key,
    required this.emojieImg,
    required this.emojieTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FeedBackScreen(feel: emojieTitle),
            ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            emojieImg,
            width: 200.w,
            height: 200.h,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            emojieTitle,
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
        ],
      ),
    );
  }
}
