import 'package:flutter/material.dart';
import 'package:organic/core/common/common.dart';
import 'package:organic/core/utils/utils.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Text(
              "Welcome To",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            Image.asset(
              AppImages.LOGO,
              width: 135.w,
              height: 64.h,
            ),
            SizedBox(height: 16.h),
            const Text(
                "Shop smarter, not harder, with our grocery\napp Your virtual grocery store – open 24/7."),
            Expanded(
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  Positioned(
                    bottom: -10.h,
                    left: -50.w,
                    child: SizedBox(
                      width: AppDimensions.width,
                      child: Image.asset(AppImages.START, fit: BoxFit.cover),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: PrimaryButton(
                      onTap: () {},
                      margin: 24.allInsets,
                      text: 'Get Started',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
