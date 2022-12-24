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
    List<ProductModel> productsList=[];
   try {
    final Response response=await _dioProvider.client.get(Endpoints.productsUrl);
    if(response.statusCode==200){
         productsList = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();

    }
    return productsList;
   } on DioError catch (e) {
     final errorMessage = DioExceptions.fromDioError(e).toString();
     throw errorMessage;
   }
  }

}