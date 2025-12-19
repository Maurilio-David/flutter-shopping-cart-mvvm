import 'package:flutter/material.dart';
import '../data/services/products_api.dart';

class ProductsViewModel extends ChangeNotifier {
  final ProductsApi api;

  ProductsViewModel(this.api);

  bool isLoading = false;
  String? error;

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    isLoading = false;
    notifyListeners();
  }
}
