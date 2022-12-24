
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';

abstract class ProductsRepository{

  Future<List<ProductModel>> getProducts();

}