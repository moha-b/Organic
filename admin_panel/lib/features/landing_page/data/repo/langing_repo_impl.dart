import 'dart:developer';

import 'package:admin_panel/core/firebase/firebase.dart';
import 'package:admin_panel/core/network/network.dart';
import 'package:admin_panel/features/landing_page/data/models/product_model.dart';
import 'package:admin_panel/features/landing_page/data/repo/langing_repo.dart';
import 'package:fpdart/src/either.dart';

class LandingRepoImpl extends LandingRepository {
  @override
  Future addProduct(ProductModel product) async {
    try {
      await FirestoreService.instance.addProduct(product.toMap());
    } catch (e) {
      log(e.toString(), name: "LandingRepoImpl");
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      var result = await FirestoreService.instance.getProducts();
      var products = result.map((e) => ProductModel.fromMap(e)).toList();
      return right(products);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure!);
    }
  }
}
