import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/logic/cubits/category/category_cubit.dart';
import 'package:flutter_ecommerce_app/logic/cubits/category/category_state.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      if (state is CategoryLoadingState && state.categories.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CategoryErrorState && state.categories.isEmpty) {
        return Center(
          child: Text(state.message.toString()),
        );
      }
      return ListView.builder(
        itemCount: state.categories.length,
        itemBuilder: (context, index) {
          final category = state.categories[index];
          return ListTile(
            onTap: () {},
            leading: const Icon(Icons.category),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: Text(category.title.toString()),
          );
        },
      );
    });
  }
}
