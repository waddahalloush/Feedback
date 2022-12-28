import 'package:shared_preferences/shared_preferences.dart';

class AdminInfoHelper {
  Future<void> cacheAdminInfo(String password) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    
    sharedPreferences.setString("adminPass", password);
  }

 

  Future<String> getCachedAdminPassword() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedAdminPassword = sharedPreferences.getString("adminPass");

   if (cachedAdminPassword != null) {
      return cachedAdminPassword;
    } else {
      return 'Admin';
    }
  }
}
