
import 'package:fake_store_flutter/features/home/domain/usecases/get_products.dart';
import 'package:fake_store_flutter/features/home/presentation/bloc/products_bloc.dart';
import 'package:fake_store_flutter/features/home/presentation/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class App extends StatelessWidget {
   const App({Key? key,required this.getProducts }) : super(key: key);

final GetProducts getProducts;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

        providers: [
          BlocProvider(
            create: (_) => ProductsBloc(getProducts),
          ),

        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
           home: HomePage(),
        ),
      )
   ;

  }
}
