import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/data/models/product/product_model.dart';
import 'package:flutter_ecommerce_app/logic/cubits/product/product_state.dart';

import '../../../data/repositories/product_repositories.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState()) {
    _initialize();
  }
  final _productRepository = ProductRepositories();
  void _initialize() async {
    emit(ProductLoadingState(state.products));
    try {
      List<ProductModel> categories = await _productRepository.fetchAllProduct();
      emit(ProductLoadedState(categories));
    } catch (e) {
      emit(ProductErrorState(e.toString(), state.products));
    }
  }
}
