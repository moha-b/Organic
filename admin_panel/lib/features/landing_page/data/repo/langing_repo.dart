import 'package:fpdart/fpdart.dart';

import '../../../../core/network/network.dart';
import '../models/product_model.dart';

abstract class LandingRepository {
  Future addProduct(ProductModel product);
  Future<Either<Failure, List<ProductModel>>> getProducts();
}
