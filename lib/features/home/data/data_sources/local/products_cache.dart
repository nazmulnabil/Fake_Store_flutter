import 'package:fake_store_flutter/features/home/data/models/product_model.dart';

abstract class ProductsCache{

  List<ProductModel> getProductsCache();
  Future<void> setProductsCache({required List<ProductModel> products});

}