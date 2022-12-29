import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../Core/translations/locale_keys.g.dart';
import '../Core/utils/sql_db.dart';
import '../view/Widgets/Dialogs/add_success_dialog.dart';

class StartScreenProvider extends ChangeNotifier {
  List<String> doctorsList = [];
  List<String> departmentList = [];
  String selectedDoctor = "No doctor";
  String selectedDepartment = "No department";
  TextEditingController descController = TextEditingController();
  bool isLoading = true;

  SqlDB sqlDB = SqlDB();
  void fitchDepartment() {
    departmentList = [];
    departmentList.add('غير محدد');
    sqlDB.readData("Department").then((value) {
      for (var element in value) {
        departmentList.add(element['dep_name']);
      }

      selectedDepartment = departmentList[0];
      isLoading = false;
      notifyListeners();
    });
  }

  onDoctorDropdownchange(String val) {
    selectedDoctor = val;
    notifyListeners();
  }

  onDepartmentDropdownchange(String val) {
    selectedDepartment = val;
    doctorsList = [];
    doctorsList.add('غير محدد');
    sqlDB
        .readSpecificData("Doctors", 'department', selectedDepartment)
        .then((value) {
      for (var element in value) {
        doctorsList.add(element['doc_name']);
      }
      selectedDoctor = doctorsList[0];
      notifyListeners();
    });
  }

  void setPepoleFeedBack(String feel, BuildContext context) {
    sqlDB.insertData("FeedBack", {
      "f_note": descController.text,
      "f_feel": feel,
      "f_time": DateFormat.yMEd('ar').format(DateTime.now()),
      "f_doctor": selectedDoctor,
      "f_department": selectedDepartment,
    }).then((value) {
      descController.clear();
      addSucessDialog(
              context, LocaleKeys.thanks.tr(), LocaleKeys.thanksDesc.tr(),
              isFeedBack: true)
          .then((value) => Navigator.pop(context));
    });
  }
}
