part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsStateLoading extends ProductsState {}

class ProductsStateSuccess extends ProductsState {
   ProductsStateSuccess(this.items);

  final List<ProductModel> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class ProductsStateError extends ProductsState {
   ProductsStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
