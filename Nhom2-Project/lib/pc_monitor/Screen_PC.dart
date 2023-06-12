import 'package:doan/item/cart.dart';

import 'package:doan/product_api/produc_detail.dart';
import 'package:doan/product_api/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductServicePage extends StatefulWidget {
  @override
  _ProductServicePageState createState() => _ProductServicePageState();
}

class _ProductServicePageState extends State<ProductServicePage> {
  final ApiService _apiService = ApiService();

  late Future<List<Product>> _productsFuture;
  @override
  void initState() {
    super.initState();
    _productsFuture = _apiService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 5,
              ),
              child: Row(
                children: products
                    .map((
                      product,
                    ) =>
                        ProductCard(product: product, cart: Cart()))
                    .toList(),
              ),
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
  final Product product;
  final Cart cart;

  const ProductCard({required this.product, required this.cart});

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
            builder: (context) => ProductDetails(
              product: widget.product,
              cart: widget.cart,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Container(
          width: 170,
          height: 400,
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
                const SizedBox(height: 10),
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      widget.product.image,
                      height: 130,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  ' ${widget.product.name}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${formatCurrency.format(widget.product.price)} ₫',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 1,
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
                        )
                      ]),
                ),
                const SizedBox(height: 10),
                Row(
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
                          isFavorite ? Icons.favorite : Icons.favorite_border,
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
    );
  }
}
