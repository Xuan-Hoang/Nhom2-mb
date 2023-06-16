class CartItem {
  String id;
  String productName;
  double productPrice;
  double quantity;

  CartItem({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productName: json['productName'],
      productPrice: json['productPrice'].toDouble(),
      quantity: json['quantity'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'productPrice': productPrice,
      'quantity': quantity,
    };
  }
}
