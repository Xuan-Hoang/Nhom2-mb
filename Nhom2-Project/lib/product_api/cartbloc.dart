// import 'package:doan/product_api/product.dart';
// import 'package:rxdart/rxdart.dart';

// class CartBloc {
//   final _products = <Product>[];
//   final _cart = BehaviorSubject<List<Product>>.seeded([]);

//   Stream<List<Product>> get cart => _cart.stream;

//   void add(Product product) {
//     _products.add(product);
//     _cart.add(_products.toList());
//   }

//   void remove(Product product) {
//     _products.remove(product);
//     _cart.add(_products.toList());
//   }

//   void update(Product product) {
//     final index = _products.indexWhere((p) => p.id == product.id);
//     if (index != -1) {
//       _products[index] = product;
//       _cart.add(_products.toList());
//     }
//   }

//   void dispose() {
//     _cart.close();
//   }
// }
import 'package:doan/product_api/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class Cart {
  List<CartItem> items = [];

  void addToCart(Product product) {
    final existingIndex =
        items.indexWhere((item) => item.product.id == product.id);

    if (existingIndex != -1) {
      // Nếu sản phẩm đã tồn tại trong giỏ hàng, tăng số lượng lên 1
      items[existingIndex].quantity++;
    } else {
      // Nếu sản phẩm chưa có trong giỏ hàng, thêm vào với số lượng là 1
      items.add(CartItem(product: product));
    }
  }

  void removeFromCart(CartItem cartItem) {
    items.remove(cartItem);
  }

  void updateQuantity(CartItem cartItem, int newQuantity) {
    cartItem.quantity = newQuantity;
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in items) {
      totalPrice += cartItem.product.price * cartItem.quantity;
    }
    return totalPrice;
  }
}
