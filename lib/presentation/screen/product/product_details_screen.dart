import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_ecommerce_app/core/ui.dart';
import 'package:flutter_ecommerce_app/data/models/product/product_model.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/gap_widget.dart';
import 'package:flutter_ecommerce_app/presentation/widgets/primary_button.dart';

import '../../../logic/services/formatter.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = "product_route_name";
  const ProductDetailsScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productModel.title.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              // itemCount: widget.productModel.image?.length ?? 0,
              itemCount: 1,
              slideBuilder: (index) {
                // String url = widget.productModel.image![index];
                const String url =
                    "https://media.istockphoto.com/id/1402801804/photo/closeup-nature-view-of-palms-and-monstera-and-fern-leaf-background.jpg?s=1024x1024&w=is&k=20&c=6YUL1Kv5rgN7FAponBNcMSjX67IV6ujOQ_Qk_2L5z_s=";

                return CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const GapWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productModel.title.toString(),
                  style: CustomTexStyles.heading3,
                ),
                Text(
                  Formater.formatPrice(widget.productModel.price!),
                  style: CustomTexStyles.heading2,
                ),
                const GapWidget(
                  size: 10,
                ),
                PrimaryButton(
                  text: "Add to Cart",
                  onPressed: () {},
                ),
                const GapWidget(
                  size: 10,
                ),
                Text(
                  "Description",
                  style: CustomTexStyles.body2.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.productModel.description.toString(),
                  style: CustomTexStyles.body2.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
