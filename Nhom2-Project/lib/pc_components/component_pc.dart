import 'package:doan/header/header.dart';
import 'package:doan/item/cart.dart';
import 'package:doan/item/cart_item.dart';
import 'package:doan/item/cart_screen.dart';
import 'package:doan/product_api/comphonent_pc_product_detail.dart';
import 'package:intl/intl.dart';
import 'package:doan/product_api/product.dart';
import 'package:flutter/material.dart';

class ComponentServicePage extends StatefulWidget {
  @override
  _ComponentServicePageState createState() => _ComponentServicePageState();
}

class _ComponentServicePageState extends State<ComponentServicePage> {
  final ApiService _apiService = ApiService();
  late Future<List<ProductComponent>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = _apiService.getProducts3();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductComponent>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products
                  .map((product) => ProductCard(
                        product: product,
                        cart: Cart(),
                      ))
                  .toList(),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Failed to load products'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class ProductCard extends StatefulWidget {
  final ProductComponent product;
  final Cart cart;

  const ProductCard({required this.product, required this.cart, });

  @override
  _ProductCardState createState() => _ProductCardState();
}

final formatCurrency = NumberFormat.decimalPattern('vi');

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ComponentPcProductDetails(
              product: widget.product,
              cart: widget.cart,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 7,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                // vertical: 15,
              ),
              child: Container(
                width: 170,
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.network(
                          widget.product.image,
                          // width: double.infinity,
                          height: 130,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          ' ${widget.product.name}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.product.price} ₫',
                              style: const TextStyle(
                                fontSize: 17.5,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Giao hàng miễn phí',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: toggleFavorite,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const Text(
                            'Yêu Thích',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ProductDetails extends StatelessWidget {
//   final ProductMouse product;
//   final Cart cart;
//   const ProductDetails({required this.product, required this.cart});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Header(),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.network(
//               product.image,
//               height: 150,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product.name,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '${formatCurrency.format(product.price)}',
//                         style: const TextStyle(
//                           fontSize: 17.5,
//                           color: Colors.red,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.favorite_border,
//                               color: Colors.red,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.share,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 5),
//                   Row(
//                     children: const [
//                       Icon(Icons.star, color: Colors.yellow),
//                       Icon(Icons.star, color: Colors.yellow),
//                       Icon(Icons.star, color: Colors.yellow),
//                       Icon(Icons.star, color: Colors.yellow),
//                       Icon(Icons.star, color: Colors.yellow),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Thông Tin Chung',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   DataTable(
//                     columns: <DataColumn>[
//                       const DataColumn(
//                         label: Text('Mắt đọc'),
//                       ),
//                       DataColumn(
//                         label: Text(product.size),
//                       ),
//                     ],
//                     rows: <DataRow>[
//                       DataRow(
//                         cells: <DataCell>[
//                           DataCell(Text('Điểm ảnh trên 1 inch (DPI)')),
//                           DataCell(Text(product.DPI)),
//                         ],
//                       ),
//                       DataRow(
//                         cells: <DataCell>[
//                           DataCell(Text('Tần số phản hồi')),
//                           DataCell(Text(product.hz)),
//                         ],
//                       ),
//                       DataRow(
//                         cells: <DataCell>[
//                           DataCell(Text('Kết nối')),
//                           DataCell(Text(product.connect)),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Đánh giá chi tiết:',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   Text(
//                     product.description,
//                     style: const TextStyle(
//                         fontSize: 16, fontStyle: FontStyle.italic),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ElevatedButton.icon(
//                         onPressed: () {
//                           final cartItem = CartItem(
//                             id: product.id,
//                             productName: product.name,
//                             productPrice: product.price,
//                             quantity: 1,
//                           );
//                           cart.addCartItem(cartItem);
//                         },
//                         icon: const Icon(Icons.shopping_cart),
//                         label: const Text('Thêm vào giỏ hàng'),
//                       ),
//                       ElevatedButton.icon(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => CartPage(cart: cart),
//                             ),
//                           );
//                         },
//                         icon: const Icon(Icons.shopping_basket),
//                         label: const Text('Xem giỏ hàng'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
