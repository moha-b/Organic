import 'package:admin_panel/core/firebase/firebase.dart';
import 'package:admin_panel/core/navigation/navigation.dart';
import 'package:admin_panel/core/network/network.dart';
import 'package:admin_panel/features/dashboard/data/models/product_model.dart';
import 'package:admin_panel/features/dashboard/data/repo/dashboard_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/src/either.dart';

import '../../bloc/dashboard_bloc.dart';

class DashboardRepoImpl extends DashboardRepository {
  @override
  Future addProduct(ProductModel product) async {
    try {
      if (product.name!.isNotEmpty &&
          product.description!.isNotEmpty &&
          product.price != null &&
          product.price! >= 0) {
        await FirestoreService.instance.addProduct(product);
        ScaffoldMessenger.of(NavigationHelper.navigatorKey.currentContext!)
            .showSnackBar(
          const SnackBar(content: Text('Product added successfully')),
        );
        NavigationHelper.navigatorKey.currentContext!
            .read<DashboardBloc>()
            .add(ViewAllProducts());
        NavigationHelper.goBack();
      } else {
        ScaffoldMessenger.of(NavigationHelper.navigatorKey.currentContext!)
            .showSnackBar(
          const SnackBar(content: Text('Please fill in all fields correctly')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(NavigationHelper.navigatorKey.currentContext!)
          .showSnackBar(
        SnackBar(content: Text('Failed to add product: $e')),
      );
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

  @override
  Future<void> editProduct(ProductModel product) async {
    try {
      if (product.name!.isNotEmpty &&
          product.description!.isNotEmpty &&
          product.price != null &&
          product.price! >= 0) {
        await FirestoreService.instance
            .editProduct(product.id.toString(), product);
        ScaffoldMessenger.of(NavigationHelper.navigatorKey.currentContext!)
            .showSnackBar(
          const SnackBar(content: Text('Product edited successfully')),
        );
        NavigationHelper.navigatorKey.currentContext!
            .read<DashboardBloc>()
            .add(ViewAllProducts());
        NavigationHelper.goBack();
      } else {
        ScaffoldMessenger.of(NavigationHelper.navigatorKey.currentContext!)
            .showSnackBar(
          const SnackBar(content: Text('Please fill in all fields correctly')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(NavigationHelper.navigatorKey.currentContext!)
          .showSnackBar(
        SnackBar(content: Text('Failed to edit product: $e')),
      );
    }
  }

  @override
  Future deleteProduct(String productId) async {
    await FirestoreService.instance.deleteProduct(productId);
    ScaffoldMessenger.of(NavigationHelper.navigatorKey.currentContext!)
        .showSnackBar(
            const SnackBar(content: Text('Product Deleted successfully')));
  }
}
