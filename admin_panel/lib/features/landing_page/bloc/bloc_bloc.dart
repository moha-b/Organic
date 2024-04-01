import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/product_model.dart';
import '../data/repo/langing_repo.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class LandingBloc extends Bloc<Event, LandingState> {
  final LandingRepository landingRepository;

  LandingBloc(this.landingRepository) : super(LandingInitial()) {
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
