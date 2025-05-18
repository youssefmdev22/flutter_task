part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {
  String message;
  ProductsLoading(this.message);
}

final class ProductsSuccess extends ProductsState {
  List<Products> products;
  ProductsSuccess(this.products);
}

final class ProductsError extends ProductsState {
  String message;
  ProductsError(this.message);
}
