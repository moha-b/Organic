part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  OnboardingState();

  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title: "Explore Our Premium\nGrocery Delicacies!",
      description:
          "Experience Luxury in Every Bite\nwith Our Premium Groceries.",
      imagePath: AppImages.ONBOARDING_1,
    ),
    OnboardingModel(
      title: "Explore Our Premium\nFood Selection Today!",
      description:
          "Elevate Your Culinary Experience\nwith Our Premium Grocery Selection!",
      imagePath: AppImages.ONBOARDING_2,
    ),
    OnboardingModel(
      title: "Explore Our Top-Quality\nDairy Products",
      description: "Elevate Your Recipes\nwith Our Premium Dairy Products.",
      imagePath: AppImages.ONBOARDING_3,
    ),
  ];

  @override
  List<Object> get props => [onboardingList];
}
