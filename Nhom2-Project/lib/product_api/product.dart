// class Product {
//   final String id;
//   final String name;
//   final String imageUrl;
//   final double price;
//   final String description;

//   const Product({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.description,
//   });

//   static fromJson(json) {}
// }
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  final response = await http
      .get(Uri.parse('https://647d9632af9847108549efa7.mockapi.io/product'));
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

class Product {
  final String id;
  final String name;
  final String image;
  final double price;
  final String description;

  Product(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'].toDouble(),
      description: json['description'],
    );
  }
}
