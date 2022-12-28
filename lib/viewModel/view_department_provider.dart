import 'package:flutter/material.dart';

import '../Core/utils/sql_db.dart';

class ViewDepartmentProvider extends ChangeNotifier {
  List<Map> departmentList = [];
  bool isLoading = true;
  SqlDB sqlDB = SqlDB();
  void fitchDepartment() {
    departmentList = [];
    sqlDB.readData("Department").then((value) {
      departmentList.addAll(value);
      isLoading = false;
      notifyListeners();
    });
  }

  void deleteDepartment(int sqlid, int id) {
    sqlDB.deleteData('Department', 'dep_id = $sqlid').then((value) {
      departmentList.removeAt(id);
      notifyListeners();
    });
  }
}
