import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_task/api/api_manager.dart';
import 'package:flutter_task/api/model/products/products_response.dart';
import 'package:flutter_task/data/data_source/products_online_data_source.dart';
import 'package:flutter_task/domain/model/products.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsOnlineDataSource)
class ProductsOnlineDataSourceImpl implements ProductsOnlineDataSource{

  ApiManager _apiManager;

  ProductsOnlineDataSourceImpl(this._apiManager);

  @override
  Future<List<Products>?> getProducts() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await _apiManager.getData();
      List<dynamic> dataList = response.data;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        List<Products> productsList = dataList.map((product) {
          return ProductsResponse.fromJson(product).toProducts();
        }).toList();
        return productsList;
      } else {
        throw "Server Error";
      }
    } else {
      throw "Network Error";
    }
  }

}