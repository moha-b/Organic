class ProductModel {
  final String name;
  final double price;
  final String description;
  // TODO: add id, category, image, isPiece

  ProductModel(
      {required this.name, required this.price, required this.description});

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      name: data['name'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      description: data['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
    };
  }
}
