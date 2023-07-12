import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/data/models/category/category_model.dart';
import 'package:flutter_ecommerce_app/logic/cubits/category/category_state.dart';

import '../../../data/repositories/category_repositories.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState()) {
    _initialize();
  }
  final _categoryRepository = CategoryRepositories();
  void _initialize() async {
    emit(CategoryLoadingState(state.categories));
    try {
      List<CategoryModel> categories = await _categoryRepository.fetchAllCategory();
      emit(CategoryLoadedState(categories));
    } catch (e) {
      emit(CategoryErrorState(e.toString(), state.categories));
    }
  }
}
