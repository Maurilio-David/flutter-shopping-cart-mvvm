import 'dart:math';

import 'package:desafio_tenda/core/result/result.dart';

class CartApi {
  final _random = Random();

  Future<Result<void>> removeItem(int productId) async {
    await Future.delayed(const Duration(milliseconds: 600));

    if (_random.nextBool()) {
      return const Failure('Erro ao remover item do carrinho');
    }

    return const Success(null);
  }
}
