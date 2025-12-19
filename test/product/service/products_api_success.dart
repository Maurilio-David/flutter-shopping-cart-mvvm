import 'package:desafio_tenda/core/result/result.dart';
import 'package:desafio_tenda/features/products/data/services/products_api.dart';
import 'package:desafio_tenda/features/products/domain/product.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeProductsApiSuccess extends Fake implements ProductsApi {
  @override
  Future<Result<List<Product>>> fetchProducts() async {
    final product = Product(
      id: 1,
      title: 'Produto Teste',
      price: 99.99,
      image: 'https://example.com/image.png',
    );
    return Success([product]);
  }
}
