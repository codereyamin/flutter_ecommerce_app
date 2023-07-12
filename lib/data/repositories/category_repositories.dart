import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/api.dart';
import 'package:flutter_ecommerce_app/data/models/category/category_model.dart';

class CategoryRepositories {
  final _api = Api();
  Future<List<CategoryModel>> fetchAllCategory() async {
    try {
      Response response = await _api.sendRequest.get("/category");
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      List<CategoryModel> data = [];
      var respondData = apiResponse.data;
      for (var element in respondData) {
        data.add(CategoryModel.fromJson(element));
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
