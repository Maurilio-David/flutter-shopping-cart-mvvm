import 'package:desafio_tenda/features/products/domain/product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get subtotal => product.price * quantity;

  CartItem increment() {
    return CartItem(product: product, quantity: quantity + 1);
  }

  CartItem decrement() {
    return CartItem(product: product, quantity: quantity - 1);
  }
}
