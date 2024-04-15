import 'package:fpdart/fpdart.dart';

import '../../../../core/network/network.dart';
import '../models/product_model.dart';

abstract class DashboardRepository {
  Future addProduct(ProductModel product);
  Future editProduct(ProductModel product);
  Future deleteProduct(String productId);
  Future<Either<Failure, List<ProductModel>>> getProducts();
}
