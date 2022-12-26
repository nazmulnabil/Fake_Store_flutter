import 'package:fake_store_flutter/features/home/domain/repositories/product_repository.dart';
import 'package:fake_store_flutter/features/home/domain/usecases/get_products.dart';
import 'package:fake_store_flutter/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'app.dart';
import 'injection.dart';
import 'injection.dart' as di;





void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('cacheProducts');
  di.init();

  ProductsRepository productsRepository=locator.get<ProductsRepository>();
  GetProducts getProducts=GetProducts(productsRepository);
  Bloc.observer = SimpleBlocObserver();
  runApp( App(getProducts: getProducts));

}



