part of 'dashboard_bloc.dart';

sealed class Event extends Equatable {
  const Event();

  @override
  List<Object> get props => [];
}

final class AddProduct extends Event {
  final ProductModel product;

  const AddProduct(this.product);
}

final class EditProduct extends Event {
  final ProductModel product;

  const EditProduct(this.product);
}

final class DeleteProduct extends Event {
  final String productId;

  const DeleteProduct(this.productId);
}

final class ViewAllProducts extends Event {
  @override
  List<Object> get props => [];
}
