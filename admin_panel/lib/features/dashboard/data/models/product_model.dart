class ProductModel {
  String? name;
  double? price;
  String? description;
  // TODO: add id, category, image, created time

  ProductModel({
    this.name,
    this.price,
    this.description,
  });

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
