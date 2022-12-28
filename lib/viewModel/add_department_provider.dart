import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medical/Core/utils/sql_db.dart';

import '../Core/translations/locale_keys.g.dart';
import '../view/Widgets/Dialogs/add_success_dialog.dart';

class AddDepartmentProvider extends ChangeNotifier {
  TextEditingController depController = TextEditingController();

  GlobalKey<FormState> fkey = GlobalKey<FormState>();

  SqlDB sqlDB = SqlDB();
  addDepartment(BuildContext context) {
    if (fkey.currentState!.validate()) {
      sqlDB.insertData("Department", {"dep_name": depController.text}).then(
          (value) {
        depController.clear();
        addSucessDialog(
            context, LocaleKeys.addSuccess.tr(), LocaleKeys.successAddDep.tr());
      });
    }
  }
}
