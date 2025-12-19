import 'package:desafio_tenda/app/routes.dart';
import 'package:desafio_tenda/features/cart/viewmodel/cart_view_model.dart';
import 'package:desafio_tenda/features/checkkout/viewmodel/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVm = context.watch<CartViewModel>();
    final checkoutVm = context.watch<CheckoutViewModel>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Subtotal: R\$ ${cartVm.subtotal.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: checkoutVm.checkoutCommand.isRunning
                ? null
                : () async {
                    await checkoutVm.checkout();

                    if (checkoutVm.checkoutCommand.isSuccess &&
                        context.mounted) {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.success,
                      );
                      checkoutVm.checkoutCommand.reset();
                    }

                    if (checkoutVm.checkoutCommand.hasError &&
                        context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(checkoutVm.checkoutCommand.error!),
                        ),
                      );
                    }
                  },
            child: checkoutVm.checkoutCommand.isRunning
                ? const CircularProgressIndicator()
                : const Text('Finalizar Pedido'),
          ),
        ],
      ),
    );
  }
}
