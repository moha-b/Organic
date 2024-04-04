import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/product_model.dart';
import '../data/repo/dashboard_repo.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<Event, LandingState> {
  final DashboardRepository landingRepository;

  DashboardBloc(this.landingRepository) : super(LandingInitial()) {
    on<AddProduct>((event, emit) async {
      emit(LandingInitial());
      try {
        await landingRepository.addProduct(event.product);
        emit(LandingInitial());
      } catch (e) {
        emit(LandingError('Failed to add product: $e'));
      }
    });
    //
    on<ViewAllProducts>((event, emit) async {
      emit(LandingInitial());
      try {
        var result = await landingRepository.getProducts();
        result.fold(
          (failure) => emit(LandingError(failure.message)),
          (products) => emit(LandingLoaded(products)),
        );
      } catch (e) {
        emit(LandingError('Failed to add product: $e'));
      }
    });
  }
}
