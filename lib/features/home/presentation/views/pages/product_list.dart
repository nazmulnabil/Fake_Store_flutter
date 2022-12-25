import 'package:fake_store_flutter/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/bottom_loader.dart';
import '../widgets/product_list_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key, required this.items}) : super(key: key);

  final List<ProductModel> items;



  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  void initState() {
    super.initState();

  }

  @override

  Widget build(BuildContext context) {

    return  GridView.builder(
        gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 /3.25,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15),
        itemCount:widget.items.length,
        itemBuilder: (BuildContext ctx, index) {


            return ProductListItem(item: widget.items[index]);


        });
  }

  @override
  void dispose() {
    super.dispose();
  }

}

