import 'package:desafio_tenda/core/errors/app_exception.dart';
import 'package:desafio_tenda/features/products/data/dto/product_dto.dart';
import 'package:desafio_tenda/features/products/domain/product.dart';
import 'package:dio/dio.dart';

class ProductsApi {
  final Dio client;

  ProductsApi(this.client);

  Future<List<Product>> fetchProducts() async {
    final response = await client.get('https://fakestoreapi.com/products');

    if (response.statusCode != 200) {
      throw AppException('Erro ao buscar produtos');
    }

    final decoded = response.data as List;
    return decoded.map((e) => ProductDto.fromJson(e).toEntity()).toList();
  }
}
