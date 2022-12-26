import 'package:fake_store_flutter/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import '../widgets/product_list_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required this.items}) : super(key: key);

  final List<ProductModel> items;

  @override
  Widget build(BuildContext context) {

    return  GridView.builder(
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(

            mainAxisSpacing: 20,
            crossAxisCount: 2),
            itemCount:items.length,
            itemBuilder: (BuildContext ctx, index) {

            return ProductListItem(item:items[index]);

          }
        );
      }

   }

