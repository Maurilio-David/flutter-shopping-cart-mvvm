import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cart/viewmodel/cart_view_model.dart';
import '../../../app/routes.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVm = context.watch<CartViewModel>();
    const freight = 20.0;

    final total = cartVm.subtotal + freight;

    return Scaffold(
      appBar: AppBar(title: const Text('Pedido Finalizado')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartVm.items.length,
                itemBuilder: (_, index) {
                  final item = cartVm.items[index];

                  return ListTile(
                    leading: Image.network(
                      item.product.image,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(item.product.title),
                    subtitle: Text(
                      'R\$ ${item.product.price.toStringAsFixed(2)}',
                    ),
                    trailing: Text(
                      'Subtotal: R\$ ${item.subtotal.toStringAsFixed(2)}',
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Subtotal: R\$ ${cartVm.subtotal.toStringAsFixed(2)}'),
                  const Text('Frete: R\$ 20,00'),
                  Text(
                    'Total: R\$ ${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      cartVm.clear();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.products,
                        (_) => false,
                      );
                    },
                    child: const Text('Novo Pedido'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
