import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fake_store_flutter/core/network/api_contants.dart';
import 'package:fake_store_flutter/core/network/dio_client.dart';
import 'package:fake_store_flutter/features/home/data/data_sources/remote/products_remote_data_source.dart';
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';

import '../../../../../core/network/dio_exceptions.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource{

  ProductsRemoteDataSourceImpl(this._dioProvider);

  final DioProvider _dioProvider;


  @override
  Future<List<ProductModel>> getProducts() async{
    print("getProducts >>>>>>>>>>>>>>>>>>>>> inside remote data source");
    List<ProductModel> productsList=<ProductModel>[];
   try {
    final Response response=await _dioProvider.client.get(Endpoints.productsUrl);
    print("products respons json>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${response.data}");
    if(response.statusCode==200){
          var productResponseData=response.data;

         // productsList = productResponseData
         //    .map<ProductModel>((e) => ProductModel.fromJson(e))
         //    .toList();

          productsList= productResponseData.map<ProductModel>((product) =>
              ProductModel.fromJson(product)).toList() as List<ProductModel>;
          print("after parsing>>>>>>>>>>>>>>>>>");

          print("after parsing>>>>>>>>>>>>>>>>>$productsList");
    }


    return productsList;
   } on DioError catch (e) {
     print('exception inside dio error >>>>>>> $e');
     final errorMessage = DioExceptions.fromDioError(e).toString();
     throw errorMessage;
   }
  }

}