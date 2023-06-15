import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse('https://647d9632af9847108549efa7.mockapi.io/product_screen'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<ProductMouse>> getProducts2() async {
    final response = await http.get(
      Uri.parse('https://647d9632af9847108549efa7.mockapi.io/product_mouse'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductMouse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Future<void> addToCart(String productName, String productPrice) async {
  //   // Gửi yêu cầu API để thêm sản phẩm vào giỏ hàng
  //   // Viết mã ở đây để thực hiện yêu cầu thêm vào API api/cart
  //   // Với productName và productDetails được truyền vào từ nút "Add to Cart"
  //   final response = await http.post(
  //     Uri.parse('https://648aae6f17f1536d65e9737d.mockapi.io/cart/cart'),
  //     body: {
  //       'productName': productName,
  //       'productPrice': productPrice,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // Xử lý khi yêu cầu thành công
  //   } else {
  //     // Xử lý khi yêu cầu thất bại
  //   }
  // }
}

class Product {
  final String id;
  final String name;
  final String image;
  final double price;
  final String description;
  final String size;
  final String ratio;
  final String panels;
  final String hz;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.size,
    required this.ratio,
    required this.panels,
    required this.hz,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: utf8.decode(json['name'].codeUnits),
      image: json['image'],
      price: json['price'].toDouble(),
      description: utf8.decode(json['description'].codeUnits),
      size: json['size'],
      ratio: json['ratio'],
      panels: json['panels'],
      hz: json['hz'],
    );
  }
}

class ProductMouse {
  final String id;
  final String name;
  final String image;
  final double price;
  final String description;
  final String size;
  final String DPI;
  final String hz;
  final String connect;

  ProductMouse({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.size,
    required this.DPI,
    required this.hz,
    required this.connect,
  });

  factory ProductMouse.fromJson(Map<String, dynamic> json) {
    return ProductMouse(
      id: json['id'],
      name: utf8.decode(json['name'].codeUnits),
      image: json['image'],
      price: json['price'].toDouble(),
      description: utf8.decode(json['description'].codeUnits),
      size: json['size'],
      DPI: json['DPI'],
      hz: json['hz'],
      connect: json['connect'],
    );
  }
}
