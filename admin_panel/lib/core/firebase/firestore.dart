part of 'firebase.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String _COLLECTION_NAME = "PRODUCTS";

  FirestoreService._();

  static FirestoreService? _instance;

  static FirestoreService get instance {
    _instance ??= FirestoreService._();
    return _instance!;
  }

  Future<void> addProduct(Map<String, dynamic> productData) async {
    try {
      await _db.collection(_COLLECTION_NAME).add(productData);
      log("Product add", name: "[FirestoreService]");
    } on FirebaseFirestore catch (e) {
      print('Error adding product: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      final querySnapshot = await _db.collection(_COLLECTION_NAME).get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } on FirebaseFirestore catch (e) {
      print('Error getting products: $e');
      return [];
    }
  }
}
