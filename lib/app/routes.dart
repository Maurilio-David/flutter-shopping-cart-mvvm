import 'package:desafio_tenda/features/products/view/products_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const products = '/';
  static const cart = '/cart';
  static const success = '/success';

  static Map<String, WidgetBuilder> get routes => {
    products: (_) => const ProductsPage(),
    cart: (_) => const Placeholder(),
    success: (_) => const Placeholder(),
  };
}
