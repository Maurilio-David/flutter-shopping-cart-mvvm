// lib/features/products/data/services/products_api_impl.dart
import 'package:desafio_tenda/core/result/result.dart';
import 'package:desafio_tenda/features/products/data/dto/product_dto.dart';
import 'package:desafio_tenda/features/products/data/services/products_api.dart';
import 'package:desafio_tenda/features/products/domain/product.dart';
import 'package:dio/dio.dart';

class ProductsApiImpl implements ProductsApi {
  final Dio client;

  ProductsApiImpl(this.client);

  @override
  Future<Result<List<Product>>> fetchProducts() async {
    try {
      final response = await client.get('https://fakestoreapi.com/products');

      if (response.statusCode != 200) {
        return const Failure('Erro ao buscar produtos');
      }

      final decoded = response.data as List;

      final products = decoded
          .map((e) => ProductDto.fromJson(e).toEntity())
          .toList();

      return Success(products);
    } catch (_) {
      return const Failure('Erro ao buscar produtos');
    }
  }
}
