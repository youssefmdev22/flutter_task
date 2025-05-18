
import 'package:flutter_task/data/data_source/products_online_data_source.dart';
import 'package:flutter_task/domain/model/products.dart';
import 'package:flutter_task/domain/repos/products_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo{
  ProductsOnlineDataSource _productsOnlineDataSource;

  ProductsRepoImpl(this._productsOnlineDataSource);

  @override
  Future<List<Products>?> getProducts() {
    return _productsOnlineDataSource.getProducts();
  }

}