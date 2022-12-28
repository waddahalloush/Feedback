import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medical/Core/utils/admin_info_helper.dart';

class AppProvider extends ChangeNotifier {
  DialogType dType = DialogType.question;

  TextEditingController passController = TextEditingController();

  String adminPassword = "";
  setAdminInfo(String password) async {
    await AdminInfoHelper().cacheAdminInfo(password);

    adminPassword = await AdminInfoHelper().getCachedAdminPassword();
    notifyListeners();
  }

  getAdminInfo() async {
    adminPassword = await AdminInfoHelper().getCachedAdminPassword();
    notifyListeners();
  }

  bool isVerified() {
    if (passController.text == adminPassword) {
      dType = DialogType.success;
      notifyListeners();
      return true;
    } else {
      dType = DialogType.error;
      notifyListeners();
      return false;
    }
  }
}
