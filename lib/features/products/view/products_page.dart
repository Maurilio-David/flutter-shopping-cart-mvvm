import 'package:desafio_tenda/app/routes.dart';
import 'package:desafio_tenda/features/cart/viewmodel/cart_view_model.dart';
import 'package:desafio_tenda/features/products/domain/product.dart';
import 'package:desafio_tenda/features/products/viewmodel/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final producsVm = context.watch<ProductsViewModel>();
    final cartVm = context.watch<CartViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.cart);
                },
              ),
              if (cartVm.totalItems > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.red,
                    child: Text(
                      cartVm.totalItems.toString(),
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: SafeArea(
        child: Builder(
          builder: (_) {
            if (producsVm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (producsVm.error != null) {
              return Center(
                child: Text(
                  producsVm.error!,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return ListView.builder(
              itemCount: producsVm.products.length,
              itemBuilder: (_, index) {
                final product = producsVm.products[index];
                return _ProductTile(product: product);
              },
            );
          },
        ),
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  final Product product;

  const _ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    final cartVm = context.watch<CartViewModel>();
    final quantity = cartVm.quantity(product);

    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(
          product.image,
          width: 50,
          height: 50,
          fit: BoxFit.contain,
        ),
        title: Text(product.title),
        subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
        trailing: quantity == 0
            ? ElevatedButton(
                onPressed: () {
                  try {
                    cartVm.add(product);
                  } catch (e) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                child: const Text('Adicionar'),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => cartVm.decrement(product),
                  ),
                  Text(quantity.toString()),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => cartVm.add(product),
                  ),
                ],
              ),
      ),
    );
  }
}
