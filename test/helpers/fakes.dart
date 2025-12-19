import 'package:desafio_tenda/core/result/result.dart';
import 'package:desafio_tenda/features/products/data/services/products_api.dart';
import 'package:desafio_tenda/features/products/domain/product.dart';

final fakeProduct = Product(
  id: 1,
  title: 'Produto Teste',
  price: 10.0,
  image: 'image.png',
);

class FakeProductsApiSuccess implements ProductsApi {
  @override
  Future<Result<List<Product>>> fetchProducts() async {
    return Success([fakeProduct]);
  }
}

class FakeProductsApiError implements ProductsApi {
  @override
  Future<Result<List<Product>>> fetchProducts() async {
    return const Failure('Erro ao buscar produtos');
  }
}
