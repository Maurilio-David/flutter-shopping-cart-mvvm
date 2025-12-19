import 'package:desafio_tenda/core/result/result.dart';

class CheckoutApi {
  Future<Result<void>> checkout() async {
    await Future.delayed(const Duration(seconds: 2));
    return const Success(null);
  }
}
