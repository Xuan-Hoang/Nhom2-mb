import 'package:doan/item/cart_item.dart';

import 'package:doan/product_api/product.dart';

class Cart {
  List<CartItem> items = [];

  void addToCart(Product product) {
    CartItem? existingItem;
    for (var item in items) {
      if (item.product.id == product.id) {
        existingItem = item;
        break;
      }
    }

    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      items.add(CartItem(product: product, quantity: 1));
    }
  }

  void removeFromCart(CartItem cartItem) {
    items.remove(cartItem);
  }

  void updateQuantity(CartItem cartItem, int quantity) {
    cartItem.quantity = quantity;
  }

  double getTotalPrice() {
    return items.fold(0, (total, cartItem) {
      return total + (cartItem.product.price * cartItem.quantity);
    });
  }
}
