import 'package:doan/header/header.dart';
import 'package:doan/item/cart.dart';
import 'package:doan/item/cart_item.dart';
import 'package:doan/item/cart_screen.dart';
import 'package:doan/pc_components/component_pc.dart';
import 'package:doan/product_api/product.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class AccessoriePcProductDetails extends StatelessWidget {
  final ProductAccessorie product;
  final Cart cart;
  const AccessoriePcProductDetails({required this.product, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              product.image,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${formatCurrency.format(product.price)}',
                        style: const TextStyle(
                          fontSize: 17.5,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Thông Tin Chung',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 const SizedBox(height: 10),
                  DataTable(
                    columns: <DataColumn>[
                      const DataColumn(
                        label: Text('Mắt đọc'),
                      ),
                      DataColumn(
                        label: Text(product.size),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                        const  DataCell(Text('Điểm ảnh trên 1 inch (DPI)')),
                          DataCell(Text(product.DPI)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                        const  DataCell(Text('Tần số phản hồi')),
                          DataCell(Text(product.hz)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                         const DataCell(Text('Kết nối')),
                          DataCell(Text(product.connect)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Đánh giá chi tiết:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                        fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          final cartItem = CartItem(
                            id: product.id,
                            productName: product.name,
                            productPrice: product.price,
                            quantity: 1,
                          );
                          cart.addCartItem(cartItem);
                        },
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text('Thêm vào giỏ hàng'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartPage(cart: cart),
                            ),
                          );
                        },
                        icon: const Icon(Icons.shopping_basket),
                        label: const Text('Xem giỏ hàng'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
