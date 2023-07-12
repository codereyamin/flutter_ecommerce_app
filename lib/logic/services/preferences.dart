import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<void> saveUserDetails({required String email, required String password}) async {
    SharedPreferences instances = await SharedPreferences.getInstance();
    await instances.setString("email", email);
    await instances.setString("password", password);
    log("user data save");
  }

  static Future<Map<String, dynamic>> fetchUserDetails() async {
    SharedPreferences instances = await SharedPreferences.getInstance();
    String? email = instances.getString('email');
    String? password = instances.getString('password');
    return {"email": email, "password": password};
  }
}
