import 'package:desafio_tenda/features/products/domain/product.dart';
import 'package:flutter/material.dart';
import '../data/services/products_api.dart';

class ProductsViewModel extends ChangeNotifier {
  final ProductsApi api;

  ProductsViewModel(this.api);

  bool isLoading = false;
  String? error;
  List<Product> products = [];
  Future<void> loadProducts() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      products = await api.fetchProducts();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
