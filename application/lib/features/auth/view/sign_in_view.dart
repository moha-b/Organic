import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:organic/core/common/common.dart';
import 'package:organic/core/navigation/navigation.dart';
import 'package:organic/core/utils/utils.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppImages.LOGIN,
        fit: BoxFit.cover,
        width: AppDimensions.width,
        height: AppDimensions.height / 1.5,
      ),
      bottomSheet: Builder(builder: (context) {
        return Container(
          height: 340.h,
          width: AppDimensions.width,
          padding:
              EdgeInsets.only(left: 40.w, right: 40.w, top: 25.h, bottom: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome", style: AppText.h2()),
              SizedBox(height: 10.h),
              Text(text, style: AppText.hint(size: 16.sp)),
              SizedBox(height: 20.h),
              PrimaryButton(
                onTap: () =>
                    NavigationHelper.navigateTo(AppRoute.HOME, clean: true),
                text: "Continue with google",
                textColor: AppColors.BLACK,
                color: AppColors.WHITE,
                withIcon: true,
                icon: IconsaxPlusLinear.archive,
              ),
              SizedBox(height: 15.h),
              PrimaryButton(
                onTap: () =>
                    SnackBarHelper.showSnackBar(context, "Not Implemented yet"),
                text: "Create an account",
                withIcon: true,
                icon: IconsaxPlusLinear.profile_circle,
                iconColor: AppColors.WHITE,
              ),
              const Spacer(),
              const Align(
                  alignment: Alignment.center,
                  child: Text("Already have an account ? Login")),
            ],
          ),
        );
      }),
    );
  }
}

String text =
    "Your One-Stop Shop for Good Food and Great Deals Discover Freshness, Taste the Difference.";

class SnackBarHelper {
  static void showSnackBar(BuildContext context, String message) {
    NavigationHelper.scaffoldState.currentState?.removeCurrentSnackBar();
    NavigationHelper.scaffoldState.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        animation: CurvedAnimation(
            parent: AnimationController(
              vsync: Scaffold.of(context),
              duration: const Duration(milliseconds: 700),
            ),
            curve: Curves.easeInOut,
            reverseCurve: Curves.easeOutBack),
      ),
    );
  }
}
