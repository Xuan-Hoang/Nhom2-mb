import 'package:doan/item/Checkout.dart';
import 'package:flutter/material.dart';
import 'package:doan/item/cart.dart';
import 'package:doan/item/cart_item.dart';

class CartPage extends StatefulWidget {
  final Cart cart;

  const CartPage({required this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    try {
      final items = await widget.cart.fetchCartItems();
      setState(() {
        cartItems = items;
      });
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to fetch cart items: $error'),
        ),
      );
    }
  }

  Future<void> addCartItem(CartItem cartItem) async {
    try {
      await widget.cart.addCartItem(cartItem);
      await fetchCartItems();
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to add cart item: $error'),
        ),
      );
    }
  }

  Future<void> updateCartItem(CartItem cartItem) async {
    try {
      await widget.cart.updateCartItem(cartItem);
      await fetchCartItems();
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to update cart item: $error'),
        ),
      );
    }
  }

  Future<void> removeCartItem(CartItem cartItem) async {
    try {
      await widget.cart.removeCartItem(cartItem);
      await fetchCartItems();
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to remove cart item: $error'),
        ),
      );
    }
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.productPrice * cartItem.quantity;
    }
    return totalPrice;
  }

  Future<void> checkout() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutPage(
          cart: Cart(),
        ),
      ),
    );
  }

  void incrementQuantity(CartItem cartItem) {
    setState(() {
      cartItem.quantity++;
    });
    updateCartItem(cartItem);
  }

  void decrementQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      setState(() {
        cartItem.quantity--;
      });
      updateCartItem(cartItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            title: Text(cartItem.productName),
            subtitle: Text('\$${cartItem.productPrice.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => decrementQuantity(cartItem),
                ),
                Text(cartItem.quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => incrementQuantity(cartItem),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => removeCartItem(cartItem),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                    'Total: \$${calculateTotalPrice().toStringAsFixed(2)}'),
                trailing: ElevatedButton(
                  onPressed: checkout,
                  child: Text('Checkout'),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
