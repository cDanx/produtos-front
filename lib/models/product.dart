class Product {
  final String id;
  final String description;
  final double price;
  final int stock;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.description,
    required this.price,
    required this.stock,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      description: json['description'],
      price: json['price'].toDouble(),
      stock: json['stock'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'price': price,
      'stock': stock,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}