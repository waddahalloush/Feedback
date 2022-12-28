import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../Core/translations/locale_keys.g.dart';
import '../Core/utils/sql_db.dart';
import '../view/Widgets/Dialogs/add_success_dialog.dart';

class StartScreenProvider extends ChangeNotifier {
  List<String> doctorsList = [];
  String selectedItem = "No doctor";
  TextEditingController descController = TextEditingController();
  bool isLoading = true;
  GlobalKey<FormState> fkey = GlobalKey<FormState>();
  SqlDB sqlDB = SqlDB();
  void fitchDoctors() {
    doctorsList = [];
    sqlDB.readData("Department").then((value) {
      for (var element in value) {
        doctorsList.add(element['dep_name']);
      }
      sqlDB.readData("Doctors").then((value) {
        for (var element in value) {
          doctorsList.add(element['doc_name']);
        }
        selectedItem = doctorsList[0];
        isLoading = false;
        notifyListeners();
      });
    });
  }

  onDropdownchange(String val) {
    selectedItem = val;
    notifyListeners();
  }

  void setPepoleFeedBack(String feel, BuildContext context) {
    if (fkey.currentState!.validate()) {
      sqlDB.insertData("FeedBack", {
        "f_note": descController.text,
        "f_feel": feel,
        "f_time": DateFormat.yMEd('ar').format(DateTime.now()),
        "doctor": selectedItem,
      }).then((value) {
        descController.clear();
        addSucessDialog(
            context, LocaleKeys.thanks.tr(), LocaleKeys.thanksDesc.tr());
      });
    }
  }
}
