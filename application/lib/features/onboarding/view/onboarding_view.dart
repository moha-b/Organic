import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic/core/common/common.dart';
import 'package:organic/core/utils/utils.dart';
import 'package:organic/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:organic/features/onboarding/view/widgets/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller:
                          context.read<OnboardingCubit>().pageController,
                      onPageChanged:
                          context.read<OnboardingCubit>().onPageChanged,
                      itemCount: state.onboardingList.length,
                      itemBuilder: (context, index) => OnboardingWidget(
                        data: state.onboardingList[index],
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: context.read<OnboardingCubit>().pageController,
                    count: state.onboardingList.length,
                    effect: const WormEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        activeDotColor: AppColors.PRIMARY),
                  ),
                  SizedBox(height: 30.h),
                  PrimaryButton(
                    onTap: () => context.read<OnboardingCubit>().nextPage(),
                    margin: 24.allInsets,
                    text: 'Next',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
