import 'package:fake_store_flutter/core/value/app_colors.dart';
import 'package:fake_store_flutter/core/value/app_values.dart';
import 'package:fake_store_flutter/core/value/strings.dart';
import 'package:fake_store_flutter/core/value/text_styles.dart';
import 'package:fake_store_flutter/core/value/themes.dart';
import 'package:fake_store_flutter/features/details/presentation/views/widgets/product_image_widget.dart';
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorTransparent,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: AppValues.appBarElevation,
            iconTheme: iconThemeData,
            centerTitle: true,
            title: const Text(
              AppStrings.productDetailsText,
              style: productDetailsTextStyle,
            ),
          ),
          body: Column(
            children: [
              ProductImage(product),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: productTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.category!.toString(),
                          style: categoryTextStyle,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.colorRating,
                            ),
                            Text(
                              product.rating!.rate.toString(),
                              style: ratingBarTextStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '(${product.rating!.count} ${AppStrings.reviewsText})',
                              style:ratingCountTextSTyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      AppStrings.informationText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: informationTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.description!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 7,
                      style:productDescriptionTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 25.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${product.price!}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: priceTextStyle,
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: AppColors.addToCartButtonColor,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: Text(AppStrings.addToCartText,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style:addToCartButtonTextStyle),
                          ),
                        )
                      ]),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
