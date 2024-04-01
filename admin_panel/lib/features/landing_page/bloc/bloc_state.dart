part of 'bloc_bloc.dart';

sealed class LandingState extends Equatable {
  const LandingState();
}

final class LandingInitial extends LandingState {
  @override
  List<Object> get props => [];
}

final class LandingLoaded extends LandingState {
  final List<ProductModel> products;

  const LandingLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

final class LandingError extends LandingState {
  final String message;

  const LandingError(this.message);

  @override
  List<Object?> get props => [message];
}

final class LandingAddProduct extends LandingState {
  @override
  List<Object> get props => [];
}
