import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medical/Core/translations/locale_keys.g.dart';
import 'package:medical/Core/utils/media_query_ex.dart';
import 'package:medical/view/Widgets/custom_snackbar.dart';
import 'package:medical/viewModel/app_provider.dart';

changeAdminInfoDialog(BuildContext context, AppProvider provider) =>
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
     
      width: context.width / 2,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      dialogType: DialogType.info,
      bodyHeaderDistance: 8,
      showCloseIcon: true,
      body: Column(
        children: [
          Text(
            LocaleKeys.chgAdminInfo.tr(),
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            LocaleKeys.chgAdminNmPass.tr(),
            style: Theme.of(context).primaryTextTheme.headline3,
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: provider.passController,
            decoration: InputDecoration(
                label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(LocaleKeys.adminPassword.tr()),
            )),
          ),
        ],
      ),
      btnOkOnPress: () {
        provider.setAdminInfo(provider.passController.text);
        provider.passController.clear();
        successSnackBar(context, LocaleKeys.chgAdminInfo.tr());
      },
    )..show();
