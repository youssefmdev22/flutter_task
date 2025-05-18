import 'package:bloc/bloc.dart';
import 'package:flutter_task/domain/model/products.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_case/get_products_use_case.dart';

part 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  GetProductsUseCase _getProductsUseCase;

  ProductsCubit(this._getProductsUseCase) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading("Loading..."));
    try {
      List<Products>? products = await _getProductsUseCase();
      emit(ProductsSuccess(products ?? []));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
