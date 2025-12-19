import 'package:desafio_tenda/core/command/command.dart';
import 'package:desafio_tenda/core/errors/app_exception.dart';
import 'package:desafio_tenda/core/result/result.dart';
import 'package:desafio_tenda/features/cart/data/services/cart_api.dart';
import 'package:desafio_tenda/features/cart/domain/cart_item.dart';
import 'package:desafio_tenda/features/products/domain/product.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final CartApi _api = CartApi();
  final removeCommand = Command<void>();
  bool isLoading = false;
  String? error;

  static const maxDifferentItems = 10;

  final Map<int, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  int get totalItems =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal =>
      _items.values.fold(0, (sum, item) => sum + item.subtotal);

  bool contains(Product product) => _items.containsKey(product.id);

  int quantity(Product product) => _items[product.id]?.quantity ?? 0;

  void add(Product product) {
    if (!_items.containsKey(product.id) && _items.length >= maxDifferentItems) {
      throw AppException('Limite de 10 produtos diferentes no carrinho');
    }

    _items.update(
      product.id,
      (item) => item.increment(),
      ifAbsent: () => CartItem(product: product),
    );

    notifyListeners();
  }

  void decrement(Product product) {
    final item = _items[product.id];
    if (item == null) return;

    if (item.quantity == 1) {
      _items.remove(product.id);
    } else {
      _items[product.id] = item.decrement();
    }

    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  Future<void> remove(Product product) async {
    await removeCommand.execute(() async {
      final result = await _api.removeItem(product.id);

      if (result is Success) {
        _items.remove(product.id);
        notifyListeners();
      }

      return result;
    });
  }
}
