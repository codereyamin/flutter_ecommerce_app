import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String baseUrl = "http://192.168.184.172:5000/api";
const Map<String, dynamic> header = {'content-Type': 'application/json'};

class Api {
  final Dio _dio = Dio();
  Api() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = header;
    _dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestBody: true,
        responseBody: false,
        requestHeader: false,
        responseHeader: true));
  }

  Dio get sendRequest => _dio;
}

class ApiResponse {
  bool success;
  dynamic data;
  String? message;
  ApiResponse({required this.success, this.data, this.message});
  factory ApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    log("user apiResponse data check");
    log(data.toString());

    return ApiResponse(
        success: data['success'],
        data: data['data'],
        message: data['message'] ?? "Unexpected error");
  }
}
