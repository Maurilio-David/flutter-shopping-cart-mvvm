import 'package:flutter/material.dart';
import 'routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart MVVM',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.products,
      routes: AppRoutes.routes,
    );
  }
}
