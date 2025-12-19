import 'package:desafio_tenda/core/result/result.dart';
import 'package:desafio_tenda/features/products/data/services/products_api.dart';
import 'package:desafio_tenda/features/products/domain/product.dart';
import 'package:flutter/material.dart';

class ProductsViewModel extends ChangeNotifier {
  final ProductsApi api;

  bool isLoading = false;
  String? error;
  List<Product> products = [];

  ProductsViewModel(this.api);

  Future<void> loadProducts() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await api.fetchProducts();

    if (result is Success<List<Product>>) {
      products = result.value;
    } else if (result is Failure<List<Product>>) {
      error = result.message;
    }

    isLoading = false;
    notifyListeners();
  }
}
