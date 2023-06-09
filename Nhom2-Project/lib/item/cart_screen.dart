// import 'package:doan/product_api/cart_item.dart';
// import 'package:doan/product_api/cartbloc.dart';
// import 'package:flutter/material.dart';

// class CartScreen extends StatelessWidget {
//   final CartBloc _cartBloc = CartBloc();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Cart')),
//       body: StreamBuilder<Cart>(
//         stream: _cartBloc.cartStream,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           final cart = snapshot.data!;
//           if (cart.itemCount == 0) {
//             return Center(child: Text('Your cart is empty'));
//           } else {
//             return ListView.builder(
//               itemCount: cart.items.length,
//               itemBuilder: (context, index) {
//                 final cartItem = cart.items[index];
//                 return ListTile(
//                   leading: Image.network(cartItem.product.imageUrl),
//                   title: Text(cartItem.product.name),
//                   subtitle: Text('\$${cartItem.product.price}'),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.remove),
//                         onPressed: () => _cartBloc.updateCartItemQuantity(
//                             cartItem.product, cartItem.quantity - 1),
//                       ),
//                       Text('${cartItem.quantity}'),
//                       IconButton(
//                         icon: Icon(Icons.add),
//                         onPressed: () => _cartBloc.updateCartItemQuantity(
//                             cartItem.product, cartItem.quantity + 1),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () =>
//                             _cartBloc.removeCartItem(cartItem.product),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//       bottomNavigationBar: StreamBuilder<Cart>(
//         stream: _cartBloc.cartStream,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const SizedBox();
//           }
//           final cart = snapshot.data!;
//           return Container(
//             height: kToolbarHeight,
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Total: \$${cart.total}'),
//                 ElevatedButton(
//                   child: Text('Checkout'),
//                   onPressed: () {
//                     // TODO: Thực hiện thanh toán
//                     _cartBloc.clearCart();
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:doan/item/cart.dart';

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final Cart cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final cartItem = cart.items[index];
          return ListTile(
            leading: Image.network(cartItem.product.image),
            title: Text(cartItem.product.name),
            subtitle:
                Text('Price: \$${cartItem.product.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    cart.removeFromCart(cartItem);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Product removed from cart'),
                      ),
                    );
                  },
                ),
                Text('${cartItem.quantity}'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    int newQuantity = cartItem.quantity + 1;
                    cart.updateQuantity(cartItem, newQuantity);
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Total Price: \$${cart.getTotalPrice().toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
