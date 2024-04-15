part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();
}

final class LandingInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

final class LandingLoaded extends DashboardState {
  final List<ProductModel> products;

  const LandingLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

final class LandingError extends DashboardState {
  final String message;

  const LandingError(this.message);

  @override
  List<Object?> get props => [message];
}

final class LandingAddProduct extends DashboardState {
  @override
  List<Object> get props => [];
}
