

import 'package:dio/dio.dart';
import 'package:fake_store_flutter/core/network/dio_client.dart';
import 'package:fake_store_flutter/features/home/data/data_sources/local/products_cache.dart';
import 'package:fake_store_flutter/features/home/data/data_sources/local/products_cache_impl.dart';
import 'package:fake_store_flutter/features/home/data/data_sources/remote/products_remote_data_source.dart';
import 'package:fake_store_flutter/features/home/data/data_sources/remote/products_remote_data_source_impl.dart';
import 'package:fake_store_flutter/features/home/data/repositories/products_repository_impl.dart';
import 'package:fake_store_flutter/features/home/domain/repositories/product_repository.dart';
import 'package:fake_store_flutter/features/home/presentation/bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/network/network_info.dart';
import 'features/home/domain/usecases/get_products.dart';


final locator = GetIt.instance;

void init() {

  ///core
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker() ));


  ///data source
  locator.registerLazySingleton<ProductsRemoteDataSource>(
          () => ProductsRemoteDataSourceImpl(DioProvider(Dio())));
  locator.registerLazySingleton<ProductsCache>(
        () => ProductsCacheImpl(box:  Hive.box('cacheProducts')),
  );


  ///repositories
  locator.registerLazySingleton<ProductsRepository>(
        () => ProductsRepositoryImpl(
            locator.get<ProductsRemoteDataSource>(),
            locator.get<ProductsCache>(),
            locator.get<NetworkInfo>()) );


  ///use cases
  locator.registerLazySingleton<GetProducts>(
          () => GetProducts(locator.get<ProductsRepository>()));

  ///bloc
  locator.registerFactory(() => ProductsBloc(locator.get<GetProducts>()));

}