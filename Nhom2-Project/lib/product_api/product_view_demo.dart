import 'package:doan/header/header.dart';
import 'package:doan/product_api/cartbloc.dart';
import 'package:doan/product_api/product.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
      ),
      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(product.image.replaceAll('"', "'")),
                  // leading: Image.network(
                  //   'https://www.lg.com/vn/images/man-hinh-may-tinh/md07527526/gallery/D1.jpg',
                  //   height: 150,
                  // ),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: product),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final Cart _cart = Cart();
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.product.image),
            Text(widget.product.name),
            Text('Price: \$${widget.product.price.toStringAsFixed(2)}'),
            Text(widget.product.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_quantity > 1) {
                        _quantity--;
                      }
                    });
                  },
                ),
                Text('$_quantity'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              child: Text('Add to Cart'),
              onPressed: () {
                setState(() {
                  for (int i = 0; i < _quantity; i++) {
                    _cart.addToCart(widget.product);
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Product added to cart'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
