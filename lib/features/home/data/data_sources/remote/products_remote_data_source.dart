import 'package:fake_store_flutter/features/home/data/models/product_model.dart';

abstract class ProductsRemoteDataSource{
  Future<List<ProductModel>> getProducts();
}