import 'package:injectable/injectable.dart';

import '../model/products.dart';
import '../repos/products_repo.dart';

@injectable
class GetProductsUseCase{
  final ProductsRepo _productsRepo;

  GetProductsUseCase(this._productsRepo);

  Future<List<Products>?> call() async {
    return await _productsRepo.getProducts();
  }
}