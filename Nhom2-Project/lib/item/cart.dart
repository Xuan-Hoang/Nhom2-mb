// import 'package:doan/item/cart_item.dart';
// import 'package:doan/product_api/product.dart';

// class Cart {
//   List<CartItem> cartItems = [];

//   void addCartItem(CartItem item) {
//     // cartItems.add(item);
//     final existingItemIndex =
//         cartItems.indexWhere((cartItem) => cartItem.name == item.name);
//     if (existingItemIndex != -1) {
//       cartItems[existingItemIndex].quantity++;
//     } else {
//       cartItems.add(item);
//     }
//   }

//   int totalItemsCount() {
//     return cartItems.length;
//   }

//   double totalPrice() {
//     return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
//   }

//   void removeCartItem(CartItem item) {
//     cartItems.removeWhere((cartItem) => cartItem.id == item.id);
//   }

//   void updateCartItemQuantity(CartItem item, int quantity) {
//     final existingItemIndex =
//         cartItems.indexWhere((cartItem) => cartItem.id == item.id);
//     if (existingItemIndex != -1) {
//       cartItems[existingItemIndex].quantity = quantity;
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:doan/item/cart_item.dart';

class Cart {
  Dio _dio = Dio();

  List<CartItem> cartItems = [];

  Future<List<CartItem>> fetchCartItems() async {
    try {
      final response = await _dio
          .get('https://648aae6f17f1536d65e9737d.mockapi.io/cart/cart');
      if (response.statusCode == 200) {
        final data = response.data;
        return List<CartItem>.from(data.map((item) => CartItem.fromJson(item)));
      } else {
        throw Exception('Failed to fetch cart items');
      }
    } catch (error) {
      throw Exception('Failed to fetch cart items: $error');
    }
  }

  Future<void> addCartItem(CartItem cartItem) async {
    try {
      final response = await _dio.post(
        'https://648aae6f17f1536d65e9737d.mockapi.io/cart/cart',
        data: cartItem.toJson(),
      );
      if (response.statusCode == 201) {
        final data = response.data;
        cartItems.add(CartItem.fromJson(data));
      } else {
        throw Exception('Failed to add cart item');
      }
    } catch (error) {
      throw Exception('Failed to add cart item: $error');
    }
  }

  Future<void> updateCartItem(CartItem cartItem) async {
    try {
      final response = await _dio.put(
        'https://648aae6f17f1536d65e9737d.mockapi.io/cart/cart/${cartItem.id}',
        data: cartItem.toJson(),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update cart item');
      }
    } catch (error) {
      throw Exception('Failed to update cart item: $error');
    }
  }

  Future<void> removeCartItem(CartItem cartItem) async {
    try {
      final response = await _dio.delete(
        'https://648aae6f17f1536d65e9737d.mockapi.io/cart/cart/${cartItem.id}',
      );
      if (response.statusCode == 200) {
        cartItems.remove(cartItem);
      } else {
        throw Exception('Failed to remove cart item');
      }
    } catch (error) {
      throw Exception('Failed to remove cart item: $error');
    }
  }
}
