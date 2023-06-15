import 'package:doan/item/cart.dart';

import 'package:doan/product_api/monitor_pc_produc_detail.dart';
import 'package:doan/product_api/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductServicePage1 extends StatefulWidget {
  @override
  _ProductServicePage1State createState() => _ProductServicePage1State();
}

class _ProductServicePage1State extends State<ProductServicePage1> {
  final ApiService _apiService = ApiService();

  late Future<List<ProductMonitor>> _productsFuture;
  @override
  void initState() {
    super.initState();
    _productsFuture = _apiService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductMonitor>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;

          return Container(
            height: 650,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 2,
              childAspectRatio: 0.4,
              scrollDirection: Axis.vertical,
              children: products
                  .map((
                    product,
                  ) =>
                      ProductCard(
                        product: product,
                        cart: Cart(),
                        apiService: ApiService(),
                      ))
                  .toList(),
            ),
          );

          // Row(
          //   children: products
          //       .map((
          //         product,
          //       ) =>
          //           ProductCard(
          //             product: product,
          //             cart: Cart(),
          //             apiService: ApiService(),
          //           ))
          //       .toList(),
          // );
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
  final ProductMonitor product;
  final Cart cart;
  final ApiService apiService;
  const ProductCard(
      {required this.product, required this.cart, required this.apiService});

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
            builder: (context) => MonitorPcProductDetails(
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
                horizontal: 5,
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
                              '${formatCurrency.format(widget.product.price)} ₫',
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
                      const SizedBox(height: 10),
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
