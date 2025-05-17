import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final dio = Dio();
  final String baseUrl = "https://fakestoreapi.com/products";

  Future<Response> getData({
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      baseUrl,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }
}
