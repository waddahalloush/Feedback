import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/Core/translations/locale_keys.g.dart';
import 'package:medical/Core/utils/media_query_ex.dart';
import 'package:medical/viewModel/app_provider.dart';

showVerifyDialog(
        BuildContext context, AppProvider provider, VoidCallback onOkPress) =>
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      
      width: context.width / 2,
      dialogType: provider.dType,
      showCloseIcon: true,
      body: Column(
        children: [
          Text(
            LocaleKeys.confirmAccess.tr(),
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            LocaleKeys.accessInfo.tr(),
            style: Theme.of(context).primaryTextTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: provider.passController,
            decoration: InputDecoration(
                label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(LocaleKeys.adminPassword.tr()),
            )),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
      btnOkOnPress: onOkPress,
    )..show();
