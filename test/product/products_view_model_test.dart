import 'package:desafio_tenda/core/result/result.dart';
import 'package:desafio_tenda/features/products/domain/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/fakes.dart';

class FakeProductsViewModel extends ChangeNotifier {
  final FakeProductsApiSuccess api;

  bool isLoading = false;
  String? error;
  List<Product> products = [];

  FakeProductsViewModel(this.api);

  Future<void> loadProducts() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await api.fetchProducts();

    if (result is Success<List<Product>>) {
      products = result.value;
    }

    isLoading = false;
    notifyListeners();
  }

  void main() {
    test('loadProducts success', () async {
      final vm = FakeProductsViewModel(FakeProductsApiSuccess());

      expect(vm.isLoading, false);
      expect(vm.error, isNull);
      expect(vm.products, isEmpty);

      await vm.loadProducts();

      expect(vm.isLoading, false);
      expect(vm.error, isNull);
      expect(vm.products.length, 1);
      expect(vm.products.first.title, 'Produto Teste');
    });
  }
}
