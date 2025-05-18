import '../../domain/model/products.dart';

abstract class ProductsOnlineDataSource{
  Future<List<Products>?> getProducts();
}