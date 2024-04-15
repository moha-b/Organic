part of 'firebase.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance.collection("PRODUCTS");

  FirestoreService._();

  static FirestoreService? _instance;

  static FirestoreService get instance {
    _instance ??= FirestoreService._();
    return _instance!;
  }

  Future<void> addProduct(ProductModel product) async {
    try {
      await _db.doc(product.id).set(product.toDocument());
      log("Product add", name: "FirestoreService");
    } on FirebaseFirestore catch (e) {
      print('Error adding product: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      final querySnapshot = await _db.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } on FirebaseFirestore catch (e) {
      print('Error getting products: $e');
      return [];
    }
  }

  Future<void> editProduct(
      String productId, ProductModel updatedProductData) async {
    try {
      await _db.doc(productId).update(updatedProductData.toDocument());
      log("Product edited", name: "FirestoreService");
    } on FirebaseFirestore catch (e) {
      print('Error editing product: $e');
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await _db.doc(productId).delete();
      log("Product deleted", name: "FirestoreService");
    } on FirebaseFirestore catch (e) {
      print('Error deleting product: $e');
    }
  }
}
