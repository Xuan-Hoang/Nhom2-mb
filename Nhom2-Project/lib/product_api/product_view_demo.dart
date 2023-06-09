// import 'package:doan/header/header.dart';
// import 'package:doan/product_api/cart_item.dart';
// import 'package:doan/product_api/cart.dart';
// import 'package:doan/product_api/produc_detail.dart';
// import 'package:doan/product_api/product.dart';
// import 'package:flutter/material.dart';

// class ProductListScreen extends StatefulWidget {
//   @override
//   _ProductListScreenState createState() => _ProductListScreenState();
// }

// class _ProductListScreenState extends State<ProductListScreen> {
//   late Future<List<Product>> _productsScreen;

//   @override
//   void initState() {
//     super.initState();
//     _productsScreen = productsScreen();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Header(),
//       ),
//       body: FutureBuilder<List<Product>>(
//         future: _productsScreen,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final products = snapshot.data!;
//             return ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return ListTile(
//                   leading: Image.network(product.image.replaceAll('"', "'")),
//                   // leading: Image.network(
//                   //   'https://www.lg.com/vn/images/man-hinh-may-tinh/md07527526/gallery/D1.jpg',
//                   //   height: 150,
//                   // ),
//                   title: Text(product.name),
//                   subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ProductDetailPage(
//                                 product: product,
//                                 cart: Cart(),
//                               )),
//                     );
//                   },
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('${snapshot.error}'),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// // class ProductDetailPage extends StatefulWidget {
// //   final Product product;

// //   const ProductDetailPage({required this.product});

// //   @override
// //   _ProductDetailPageState createState() => _ProductDetailPageState();
// // }

// // class _ProductDetailPageState extends State<ProductDetailPage> {

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Product Detail'),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //         children: [
// //           Image.network(product.image),
// //           Text(product.name),
// //           Text('Price: \$${product.price.toStringAsFixed(2)}'),
// //           ElevatedButton(
// //             onPressed: () {
// //               cart.addToCart(product);
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(
// //                   content: Text('Product added to cart'),
// //                 ),
// //               );
// //             },
// //             child: Text('Add to Cart'),
// //           ),
// //         ],
// //       ),
// //       ),
// //     );
// //   }
// // }

// class ProductDetailPage extends StatelessWidget {
//   final Product product;
//   final Cart cart;

//   ProductDetailPage({required this.product, required this.cart});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Detail'),
//       ),
//       body: Column(
//         children: [
//           Image.network(product.image),
//           Text(product.name),
//           Text('Price: \$${product.price.toStringAsFixed(2)}'),
//           ElevatedButton(
//             onPressed: () {
//               cart.addToCart(product);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('Product added to cart'),
//                 ),
//               );
//             },
//             child: Text('Add to Cart'),
//           ),
//         ],
//       ),
//     );
//   }
// }
