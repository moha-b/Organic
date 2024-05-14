import 'package:flutter/material.dart';
import 'package:organic/features/onboarding/model/onboarding_model.dart';

import '../../../../core/utils/utils.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.data,
  });
  final OnboardingModel data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppDimensions.height / 2,
          width: AppDimensions.width,
          child: Image.asset(
            data.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          data.title,
          style: AppText.h1(),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Text(
          data.description,
          style: AppText.hint(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
