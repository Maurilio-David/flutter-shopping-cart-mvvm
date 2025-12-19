import 'dart:math';

class CartApi {
  final _random = Random();

  Future<void> removeItem(int productId) async {
    await Future.delayed(const Duration(milliseconds: 600));

    if (_random.nextBool()) {
      throw Exception('Erro ao remover item do carrinho');
    }
  }
}
