import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';
import 'package:fake_store_flutter/features/home/domain/usecases/get_products.dart';

import 'package:stream_transform/stream_transform.dart';


part 'products_event.dart';
part 'products_state.dart';

const throttleDuration = Duration(milliseconds: 100);

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  final GetProducts getProducts;

  ProductsBloc(this.getProducts) : super(ProductsStateLoading()) {
    on<ProductsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FetchProducts>(_onFetchProducts, transformer: debounce(_duration));
  }

  FutureOr<void> _onFetchProducts(FetchProducts event,
      Emitter<ProductsState> emit) async {
    emit(ProductsStateLoading());

    try {
      final products = await getProducts();
      // final products=await getProducts.call();

      emit(ProductsStateSuccess(products));
    } catch (error) {
      emit(error is ProductsStateError
          ? ProductsStateError(error.error)
          : ProductsStateError('something went wrong'));
    }
  }
}