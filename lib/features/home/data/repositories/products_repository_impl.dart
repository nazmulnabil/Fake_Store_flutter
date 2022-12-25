

import 'package:dio/dio.dart';
import 'package:fake_store_flutter/core/network/dio_exceptions.dart';
import 'package:fake_store_flutter/features/home/data/data_sources/local/products_cache.dart';
import 'package:fake_store_flutter/features/home/data/data_sources/remote/products_remote_data_source.dart';
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';
import 'package:fake_store_flutter/features/home/domain/repositories/product_repository.dart';


class ProductsRepositoryImpl implements ProductsRepository{

  ProductsRepositoryImpl(this._productsRemoteDataSource, this._productsCache);

  final ProductsRemoteDataSource _productsRemoteDataSource;
  final ProductsCache _productsCache;

  @override
  Future<List<ProductModel>> getProducts() async {

    print("inside products repository >>>>>>>>>>>>>>>>>>>>>>>> ");
    // TODO: implement getProducts
    try {
       final products = await _productsRemoteDataSource.getProducts();
       await _productsCache.setProductsCache(products: products);
       return products;
    } catch (e) {

      // if the API call fails...
      try {
        final model = _productsCache.getProductsCache();
        return model;
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
        throw errorMessage;
      }
    }
  }
}