import 'package:fake_store_flutter/core/value/app_values.dart';
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductImage extends StatelessWidget {
   const ProductImage(this.product,{Key? key}) : super(key: key);

 final  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(AppValues.imagePadding),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 140,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(product.image!),
                  fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
