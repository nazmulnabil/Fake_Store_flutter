import 'package:dartz/dartz.dart';
import 'package:fake_store_flutter/core/error%20handling/failures.dart';
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';

abstract class ProductsRepository{
 // Either<Failure, List<ProductModel>>>
  Future<Either<Failure, List<ProductModel>>> getProducts();

}