import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';
import 'dashboard_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CredMate'),
        actions: [
          IconButton(
            icon: const Icon(Icons.dashboard),
            onPressed: () =>
                Navigator.pushNamed(context, DashboardScreen.routeName),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (ctx, i) => ProductCard(product: products[i]),
        ),
      ),
    );
  }
}
