import 'package:flutter/material.dart';

class AppRoutes {
  static const products = '/';
  static const cart = '/cart';
  static const success = '/success';

  static Map<String, WidgetBuilder> get routes => {
    products: (_) => const Placeholder(),
    cart: (_) => const Placeholder(),
    success: (_) => const Placeholder(),
  };
}
