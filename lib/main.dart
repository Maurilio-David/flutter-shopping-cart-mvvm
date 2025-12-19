import 'package:desafio_tenda/app/app_widget.dart';
import 'package:desafio_tenda/features/cart/viewmodel/cart_view_model.dart';
import 'package:desafio_tenda/features/checkkout/data/services/checkout_api.dart';
import 'package:desafio_tenda/features/checkkout/viewmodel/checkout_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/products/data/services/products_api.dart';
import 'features/products/viewmodel/products_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        ChangeNotifierProvider(
          create: (_) => ProductsViewModel(ProductsApi(Dio()))..loadProducts(),
        ),
        ChangeNotifierProvider(create: (_) => CheckoutViewModel(CheckoutApi())),
      ],
      child: const AppWidget(),
    ),
  );
}
