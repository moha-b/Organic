import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/navigation/navigation.dart';

import '../../../core/utils/utils.dart';
import '../model/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController();
  OnboardingCubit() : super(OnboardingState());
  int currentPage = 1;
  void onPageChanged(int value) {
    currentPage = value;
    emit(OnboardingState());
  }

  void nextPage() {
    if (currentPage < state.onboardingList.length - 1) {
      currentPage++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(OnboardingState());
    } else {
      NavigationHelper.navigateTo(AppRoute.SIGN_IN, delete: true);
    }
  }
}
