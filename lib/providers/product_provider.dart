import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/mock_api.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  ProductProvider() {
    // Load mock or demo products at startup
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      // ✅ Try fetching from mock API (if available)
      final fetched = await MockApi.fetchProducts();

      if (fetched.isNotEmpty) {
        _products = fetched;
      } else {
        // ✅ Fallback to demoProducts from product.dart
        _products = demoProducts;
      }
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ Mock API fetch failed, using local demo products. Error: $e');
      }
      _products = demoProducts;
    }

    notifyListeners();
  }

  Product? findById(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}
