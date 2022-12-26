
import 'package:dartz/dartz.dart';
import 'package:fake_store_flutter/core/error%20handling/failures.dart';
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';
import 'package:fake_store_flutter/features/home/domain/repositories/product_repository.dart';

class GetProducts{


  final ProductsRepository _productsRepository;

  GetProducts( this._productsRepository);

  Future<Either<Failure, List<ProductModel>>> call () async{
     // call function content
    return await  _productsRepository.getProducts();
  }

}