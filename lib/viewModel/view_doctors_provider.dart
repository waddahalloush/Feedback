import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medical/Core/utils/sql_db.dart';
import 'package:medical/view/Widgets/Dialogs/add_success_dialog.dart';

import '../Core/translations/locale_keys.g.dart';

class ViewDoctorsProvider extends ChangeNotifier {
  List<Map> doctorsList = [];
  bool isLoading = true;
  SqlDB sqlDB = SqlDB();
  void fitchDoctors() {
    doctorsList = [];
    sqlDB.readData("Doctors").then((value) {
      doctorsList.addAll(value);
      isLoading = false;
      notifyListeners();
    });
  }

  void deleteDoctor(int sqlid, int id) {
    sqlDB.deleteData('Doctors', 'doc_id = $sqlid').then((value) {
      doctorsList.removeAt(id);
      notifyListeners();
    });
  }

  void updateDoctor(String newVal, int oldVal, BuildContext context) {
    sqlDB
        .updateData('Doctors', {'doc_name': newVal}, 'doc_id = $oldVal')
        .then((value) {
      fitchDoctors();
      addSucessDialog(
          context, LocaleKeys.addSuccess.tr(), LocaleKeys.successAddDep.tr());
    });
  }
}
