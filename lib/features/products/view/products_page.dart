import 'package:desafio_tenda/features/products/viewmodel/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductsViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      body: Builder(
        builder: (_) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.error != null) {
            return Center(
              child: Text(vm.error!, style: const TextStyle(color: Colors.red)),
            );
          }

          return ListView.builder(
            itemCount: vm.products.length,
            itemBuilder: (_, index) {
              final product = vm.products[index];
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
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Adicionar'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
