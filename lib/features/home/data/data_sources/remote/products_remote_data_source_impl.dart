import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fake_store_flutter/core/error%20handling/exceptions.dart';
import 'package:fake_store_flutter/core/network/api_contants.dart';
import 'package:fake_store_flutter/core/network/dio_client.dart';
import 'package:fake_store_flutter/features/home/data/data_sources/remote/products_remote_data_source.dart';
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource{

  ProductsRemoteDataSourceImpl(this._dioProvider);

  final DioProvider _dioProvider;


  @override
  Future<List<ProductModel>> getProducts() async{

    List<ProductModel> productsList=<ProductModel>[];
    final Response response=await _dioProvider.client.get(Endpoints.productsUrl);
    var productResponseData=response.data;
    productsList= productResponseData.map<ProductModel>((product) =>
    ProductModel.fromJson(product)).toList() as List<ProductModel>;
    return productsList;

  }

}