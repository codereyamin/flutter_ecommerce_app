import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<void> saveUserDetails({required String email, required String password}) async {
    log("user data save function");
    SharedPreferences instances = await SharedPreferences.getInstance();
    await instances.setString("email", email);
    await instances.setString("password", password);
    log("user data save");
  }

  static Future<Map<String, dynamic>> fetchUserDetails() async {
    SharedPreferences instances = await SharedPreferences.getInstance();
    log("user data fetch function");
    String? email = instances.getString('email');
    String? password = instances.getString('password');
    log("user data fetch");
    return {"email": email, "password": password};
  }
}
