import 'package:desafio_tenda/core/result/result.dart';
import 'package:desafio_tenda/features/products/domain/product.dart';

abstract class ProductsApi {
  Future<Result<List<Product>>> fetchProducts();
}
