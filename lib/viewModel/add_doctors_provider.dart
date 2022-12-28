import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medical/Core/translations/locale_keys.g.dart';
import 'package:medical/Core/utils/sql_db.dart';
import 'package:medical/view/Widgets/Dialogs/add_success_dialog.dart';

class AddDoctorsProvider extends ChangeNotifier {
  TextEditingController docController = TextEditingController();
  GlobalKey<FormState> fkey = GlobalKey<FormState>();
  List<String> departmentList = [];
  String selectedItem = "No department";
  bool isLoading = true;
  SqlDB sqlDB = SqlDB();
  void fitchDepartment() {
    departmentList = [];
    sqlDB.readData("Department").then((value) {
      for (var element in value) {
        departmentList.add(element['dep_name']);
      }
      selectedItem = departmentList[0];
      isLoading = false;
      notifyListeners();
    });
  }

  onDropdownchange(String val) {
    selectedItem = val;
    notifyListeners();
  }

  addDepartmentAndDoctors(BuildContext context) {
    if (fkey.currentState!.validate()) {
      sqlDB.insertData("Doctors", {
        "doc_name": docController.text,
        "department": selectedItem
      }).then((value) {
        docController.clear();
        addSucessDialog(
            context, LocaleKeys.addSuccess.tr(), LocaleKeys.successAddDep.tr());
      });
    }
  }
}
