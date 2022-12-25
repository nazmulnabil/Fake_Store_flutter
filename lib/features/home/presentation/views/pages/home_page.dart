import 'package:fake_store_flutter/features/home/presentation/bloc/products_bloc.dart';
import 'package:fake_store_flutter/features/home/presentation/views/pages/product_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_colors.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductsBloc _productsBloc;
  @override
  void initState() {
    super.initState();
     _productsBloc= context.read<ProductsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Fake Store'),
            centerTitle: true,
            backgroundColor: Colors.lightBlue,
          ),

          backgroundColor: AppColors.pageBackground,
          body:BlocProvider(
              create: (_) => _productsBloc..add(FetchProducts()),
              child: _ProductListView()),
        ),
      ),
    );
  }
}

class _ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(

      builder: (context, state) {

        if (state is ProductsStateLoading) {
          return const CircularProgressIndicator();
        }
        if (state is ProductsStateError) {
          return Text(state.error);
        }
        if (state is ProductsStateSuccess) {

         int length=state.items.length;

         if (kDebugMode) {
           print('length>>>>> $length');
         }

         return state.items.isEmpty
             ? const Text('No Results')
             : 
         ProductList(items:state.items);
        }
        return const Text('Sorry no content found.');
      },
    );
  }
}

