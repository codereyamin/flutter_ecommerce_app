import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/api.dart';

import '../models/product/product_model.dart';

class ProductRepositories {
  final _api = Api();
  Future<List<ProductModel>> fetchAllProduct() async {
    try {
      Response response = await _api.sendRequest.get("/product");
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      List<ProductModel> data = [];
      var respondData = apiResponse.data;
      for (var element in respondData) {
        data.add(ProductModel.fromJson(element));
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> fetchProductByCategory(String categoryId) async {
    try {
      Response response = await _api.sendRequest.get("/product/category/$categoryId");
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      List<ProductModel> data = [];
      var respondData = apiResponse.data;
      for (var element in respondData) {
        data.add(ProductModel.fromJson(element));
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
