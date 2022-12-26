
import 'package:dartz/dartz.dart';
import 'package:fake_store_flutter/core/error%20handling/exceptions.dart';
import 'package:fake_store_flutter/core/error%20handling/failures.dart';
import 'package:fake_store_flutter/core/network/network_info.dart';
import 'package:fake_store_flutter/features/home/data/data_sources/local/products_cache.dart';
import 'package:fake_store_flutter/features/home/data/data_sources/remote/products_remote_data_source.dart';
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';
import 'package:fake_store_flutter/features/home/domain/repositories/product_repository.dart';


class ProductsRepositoryImpl implements ProductsRepository{

  ProductsRepositoryImpl(this._productsRemoteDataSource, this._productsCache, this.networkInfo);

  final ProductsRemoteDataSource _productsRemoteDataSource;
  final ProductsCache _productsCache;
  final NetworkInfo networkInfo;
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {

    // TODO: implement getProducts


    if (await networkInfo.isConnected) {
      try {
        final products = await _productsRemoteDataSource.getProducts();
        await _productsCache.setProductsCache(products: products);
        return Right(products);
          } on BadRequestException catch (e){
             return  Left(ServerFailure(e.message));
          }
           on InternalServerErrorException catch (e){
        return  Left(ServerFailure(e.message));
      }
      on ConflictException catch (e){
        return  Left(ServerFailure(e.message));
      }
      on UnauthorizedException catch (e){
        return  Left(ServerFailure(e.message));
      }
      on NotFoundException catch (e){
        return  Left(ServerFailure(e.message));
      }
      on NoInternetConnectionException catch (e){
        return  Left(ServerFailure(e.message));
      }
      on DeadlineExceededException catch (e){
        return  Left(ServerFailure(e.message));
      }

     } else{
      try{
        final cachedProducts = _productsCache.getProductsCache();
        return right(cachedProducts);
      }on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }
}