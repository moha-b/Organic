import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/product_model.dart';
import '../data/repo/dashboard_repo.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<Event, DashboardState> {
  final DashboardRepository dashboardRepository;

  DashboardBloc(this.dashboardRepository) : super(LandingInitial()) {
    on<AddProduct>((event, emit) async {
      emit(LandingInitial());
      try {
        await dashboardRepository.addProduct(event.product);
        emit(LandingInitial());
      } catch (e) {
        emit(LandingError('Failed to add product: $e'));
      }
    });
    //
    on<ViewAllProducts>((event, emit) async {
      emit(LandingInitial());
      try {
        var result = await dashboardRepository.getProducts();
        result.fold(
          (failure) => emit(LandingError(failure.message)),
          (products) => emit(LandingLoaded(products)),
        );
      } catch (e) {
        emit(LandingError('Failed to View product: $e'));
      }
    });
    on<EditProduct>((event, emit) async {
      emit(LandingInitial());
      try {
        await dashboardRepository.editProduct(event.product);
        emit(LandingInitial());
      } catch (e) {
        emit(LandingError('Failed to edit product: $e'));
      }
    });

    on<DeleteProduct>((event, emit) async {
      emit(LandingInitial());
      try {
        await dashboardRepository.deleteProduct(event.productId);
      } catch (e) {
        emit(LandingError('Failed to delete product: $e'));
      }
    });
  }
}
