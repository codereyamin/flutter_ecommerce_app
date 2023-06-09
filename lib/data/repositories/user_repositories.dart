import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/api.dart';
import 'package:flutter_ecommerce_app/data/models/user/user_model.dart';

class UserRepository {
  final _api = Api();

  // account create function
  Future createAccount({required String email, required String password}) async {
    try {
      Response response = await _api.sendRequest
          .post("/user/createAccount", data: jsonEncode({"email": email, "password": password}));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return UserModel.fromJson(apiResponse.data);
    } catch (e) {
      rethrow;
    }
  }

  // account singIn function
  Future singIn({required String email, required String password}) async {
    try {
      log("repositories login function call ");
      Response response = await _api.sendRequest
          .post("/user/signIn", data: jsonEncode({"email": email, "password": password}));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      log(response.toString());
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return UserModel.fromJson(apiResponse.data);
    } catch (e) {
      rethrow;
    }
  }
}
