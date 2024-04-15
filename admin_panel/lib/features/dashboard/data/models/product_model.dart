import '../../../../core/resources/resources.dart';

class ProductModel {
  String id;
  String? name;
  String? image;
  double? price;
  String? description;
  ProductType? category;
  String? createdTime;

  ProductModel({
    required this.id,
    this.name,
    this.price,
    this.description,
    this.image,
    this.category,
    this.createdTime,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      name: data['name'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      description: data['description'] ?? '',
      image: data['image'],
      category: data['category'],
      createdTime: data['time'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'category': category,
      'time': createdTime,
    };
  }
}
