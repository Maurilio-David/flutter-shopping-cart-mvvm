import 'package:desafio_tenda/core/command/command.dart';
import 'package:desafio_tenda/features/checkkout/data/services/checkout_api.dart';
import 'package:flutter/material.dart';

class CheckoutViewModel extends ChangeNotifier {
  final CheckoutApi api;
  final checkoutCommand = Command<void>();
  CheckoutViewModel(this.api);

  bool isLoading = false;
  String? errorMessage;

  Future<void> checkout() async {
    await checkoutCommand.execute(api.checkout);
  }
}
