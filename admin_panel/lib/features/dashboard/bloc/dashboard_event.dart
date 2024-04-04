part of 'dashboard_bloc.dart';

sealed class Event extends Equatable {
  const Event();
}

final class AddProduct extends Event {
  final ProductModel product;

  const AddProduct(this.product);

  @override
  List<Object> get props => [];
}

final class ViewAllProducts extends Event {
  @override
  List<Object> get props => [];
}
