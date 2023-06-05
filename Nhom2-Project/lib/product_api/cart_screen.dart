// // import 'package:doan/product_api/cart_item.dart';
// // import 'package:doan/product_api/cartbloc.dart';
// // import 'package:flutter/material.dart';

// // class CartScreen extends StatelessWidget {
// //   final CartBloc _cartBloc = CartBloc();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Cart')),
// //       body: StreamBuilder<Cart>(
// //         stream: _cartBloc.cartStream,
// //         builder: (context, snapshot) {
// //           if (!snapshot.hasData) {
// //             return const Center(child: CircularProgressIndicator());
// //           }
// //           final cart = snapshot.data!;
// //           if (cart.itemCount == 0) {
// //             return Center(child: Text('Your cart is empty'));
// //           } else {
// //             return ListView.builder(
// //               itemCount: cart.items.length,
// //               itemBuilder: (context, index) {
// //                 final cartItem = cart.items[index];
// //                 return ListTile(
// //                   leading: Image.network(cartItem.product.imageUrl),
// //                   title: Text(cartItem.product.name),
// //                   subtitle: Text('\$${cartItem.product.price}'),
// //                   trailing: Row(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       IconButton(
// //                         icon: Icon(Icons.remove),
// //                         onPressed: () => _cartBloc.updateCartItemQuantity(
// //                             cartItem.product, cartItem.quantity - 1),
// //                       ),
// //                       Text('${cartItem.quantity}'),
// //                       IconButton(
// //                         icon: Icon(Icons.add),
// //                         onPressed: () => _cartBloc.updateCartItemQuantity(
// //                             cartItem.product, cartItem.quantity + 1),
// //                       ),
// //                       IconButton(
// //                         icon: Icon(Icons.delete),
// //                         onPressed: () =>
// //                             _cartBloc.removeCartItem(cartItem.product),
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             );
// //           }
// //         },
// //       ),
// //       bottomNavigationBar: StreamBuilder<Cart>(
// //         stream: _cartBloc.cartStream,
// //         builder: (context, snapshot) {
// //           if (!snapshot.hasData) {
// //             return const SizedBox();
// //           }
// //           final cart = snapshot.data!;
// //           return Container(
// //             height: kToolbarHeight,
// //             padding: EdgeInsets.symmetric(horizontal: 16),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text('Total: \$${cart.total}'),
// //                 ElevatedButton(
// //                   child: Text('Checkout'),
// //                   onPressed: () {
// //                     // TODO: Thực hiện thanh toán
// //                     _cartBloc.clearCart();
// //                     Navigator.pop(context);
// //                   },
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'product.dart';

// class CartItem {
//   final Product product;
//   int quantity;

//   CartItem({required this.product, required this.quantity});
// }

// class Cart {
//   static final Cart _instance = Cart._internal();

//   factory Cart() {
//     return _instance;
//   }

//   Cart._internal();

//   List<CartItem> cartItems = [];

//   void addToCart(CartItem cartItem) {
//     final existingItemIndex = cartItems.indexWhere(
//       (item) => item.product.id == cartItem.product.id,
//     );

//     if (existingItemIndex != -1) {
//       cartItems[existingItemIndex].quantity += cartItem.quantity;
//     } else {
//       cartItems.add(cartItem);
//     }
//   }

//   void removeFromCart(CartItem cartItem) {
//     cartItems.remove(cartItem);
//   }

//   void updateQuantity(CartItem cartItem, int newQuantity) {
//     cartItem.quantity = newQuantity;
//   }

//   double getTotalPrice() {
//     double totalPrice = 0;
//     for (var cartItem in cartItems) {
//       totalPrice += cartItem.product.price * cartItem.quantity;
//     }
//     return totalPrice;
//   }
// }

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   final Cart _cart = Cart.getInstance();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: _cart.cartItems.length,
//         itemBuilder: (context, index) {
//           final cartItem = _cart.cartItems[index];
//           return ListTile(
//             leading: Image.network(cartItem.product.image),
//             title: Text(cartItem.product.name),
//             subtitle:
//                 Text('Price: \$${cartItem.product.price.toStringAsFixed(2)}'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.remove),
//                   onPressed: () {
//                     setState(() {
//                       _cart.removeFromCart(cartItem);
//                     });
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Product removed from cart'),
//                       ),
//                     );
//                   },
//                 ),
//                 Text('${cartItem.quantity}'),
//                 IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: () {
//                     setState(() {
//                       int newQuantity = cartItem.quantity + 1;
//                       _cart.updateQuantity(cartItem, newQuantity);
//                     });
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.all(16),
//         child: Text(
//           'Total Price: \$${_cart.getTotalPrice().toStringAsFixed(2)}',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
