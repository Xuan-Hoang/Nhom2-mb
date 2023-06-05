// import 'package:doan/product_api/product.dart';
// import 'package:flutter/foundation.dart';

// class CartItem {
//   final Product product;
//   int quantity;

//   CartItem({required this.product, this.quantity = 1});
// }

// class Cart with ChangeNotifier {
//   final List<CartItem> _items = [];

//   List<CartItem> get items => List.unmodifiable(_items);

//   int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

//   double get total =>
//       _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);

//   void addItem(Product product) {
//     final existingItemIndex =
//         _items.indexWhere((item) => item.product.id == product.id);
//     if (existingItemIndex >= 0) {
//       _items[existingItemIndex].quantity++;
//     } else {
//       _items.add(CartItem(product: product));
//     }
//     notifyListeners();
//   }

//   void removeItem(Product product) {
//     _items.removeWhere((item) => item.product.id == product.id);
//     notifyListeners();
//   }

//   void updateItemQuantity(Product product, int quantity) {
//     final item = _items.firstWhere((item) => item.product.id == product.id);
//     item.quantity = quantity;
//     notifyListeners();
//   }

//   void clear() {
//     _items.clear();
//     notifyListeners();
//   }
// }
