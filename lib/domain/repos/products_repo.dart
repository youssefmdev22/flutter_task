import 'package:flutter_task/domain/model/products.dart';

abstract class ProductsRepo {
  Future<List<Products>?> getProducts();
}