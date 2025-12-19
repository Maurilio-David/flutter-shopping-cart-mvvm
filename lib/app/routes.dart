import 'package:desafio_tenda/features/cart/view/cart_page.dart';
import 'package:desafio_tenda/features/checkkout/view/order_success_page.dart';
import 'package:desafio_tenda/features/products/view/products_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const products = '/';
  static const cart = '/cart';
  static const success = '/success';

  static Map<String, WidgetBuilder> get routes => {
    products: (_) => const ProductsPage(),
    cart: (_) => const CartPage(),
    success: (_) => const OrderSuccessPage(),
  };
}
