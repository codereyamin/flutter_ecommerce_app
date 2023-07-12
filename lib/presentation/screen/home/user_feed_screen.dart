import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/logic/cubits/product/product_cubit.dart';
import 'package:flutter_ecommerce_app/logic/cubits/product/product_state.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/gap_widget.dart';

import '../../../core/ui.dart';
import '../../../logic/services/formatter.dart';

class UserFeedScreen extends StatefulWidget {
  const UserFeedScreen({super.key});

  @override
  State<UserFeedScreen> createState() => _UserFeedScreenState();
}

class _UserFeedScreenState extends State<UserFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoadingState && state.products.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ProductErrorState && state.products.isEmpty) {
        return Center(
          child: Text(state.message.toString()),
        );
      }
      return ListView.builder(
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          const String imgUrl =
              "https://media.istockphoto.com/id/1402801804/photo/closeup-nature-view-of-palms-and-monstera-and-fern-leaf-background.jpg?s=1024x1024&w=is&k=20&c=6YUL1Kv5rgN7FAponBNcMSjX67IV6ujOQ_Qk_2L5z_s=";

          final product = state.products[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imgUrl,
                  width: MediaQuery.of(context).size.width / 2.5,
                ),
                const GapWidget(),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.toString(),
                        style: CustomTexStyles.body1.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        product.description.toString(),
                        style: CustomTexStyles.body2.copyWith(
                          color: AppColors.textLight,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const GapWidget(),
                      Text(
                        "\$ ${Formater.formatPrice(product.price!)}",
                        style: CustomTexStyles.heading3,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    });
  }
}
