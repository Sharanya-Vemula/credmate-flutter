import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            product.image, // ✅ Using network image (not asset)
            width: 48,
            height: 48,
            fit: BoxFit.cover, // ✅ Correct property name
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.broken_image,
              size: 40,
              color: Colors.grey,
            ),
          ),
        ),
        title: Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '₹${product.price.toStringAsFixed(0)}',
          style: const TextStyle(color: Colors.indigo),
        ),
        trailing: ElevatedButton(
          onPressed: () => Navigator.pushNamed(
            context,
            ProductDetailScreen.routeName,
            arguments: product,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('View'),
        ),
      ),
    );
  }
}
