import 'package:doan/item/cart.dart';
import 'package:doan/item/cart_item.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final Cart cart;

  const CheckoutPage({required this.cart});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.productPrice * cartItem.quantity;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đặt hàng'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vui lòng Nhập Địa Chỉ Giao Hàng',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Họ và Tên',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Số Điện Thoại',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Địa Chỉ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sản phẩm trong giỏ hàng:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  title: Text(cartItem.productName),
                  subtitle:
                      Text('${cartItem.quantity} x ${cartItem.productPrice}đ'),
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Tổng tiền:  ${calculateTotalPrice()}đ',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Đặt hàng'),
            ),
          ],
        ),
      ),
    );
  }
}
