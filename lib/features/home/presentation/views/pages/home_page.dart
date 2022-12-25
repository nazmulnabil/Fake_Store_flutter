import 'package:fake_store_flutter/core/value/strings.dart';
import 'package:fake_store_flutter/core/value/text_styles.dart';
import 'package:fake_store_flutter/core/value/themes.dart';
import 'package:fake_store_flutter/features/home/presentation/bloc/products_bloc.dart';
import 'package:fake_store_flutter/features/home/presentation/views/pages/product_list.dart';
import 'package:fake_store_flutter/features/home/presentation/views/widgets/bottom_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/value/app_colors.dart';

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
      color:AppColors.colorTransparent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appNameText,

             style: appBarTitleStyle,

            ),
            centerTitle: true,
            backgroundColor: AppColors.colorTransparent,
            elevation: 0,
            iconTheme: iconThemeData,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      child: BlocBuilder<ProductsBloc, ProductsState>(

        builder: (context, state) {

          if (state is ProductsStateLoading) {
            return  Loader();
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
               ? const Text(AppStrings.emptyListText)
               :
           ProductList(items:state.items);
          }
          return const Text('Sorry no content found.');
        },
      ),
    );
  }
}

