import '../../localization/locale_keys.g.dart';

class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });

  static final List<OnboardingContent> content = [
    OnboardingContent(
      image: 'assets/images/onboarding/onboarding1.png',
      title: LocaleKeys.getTheBestSmartphone,
      description: LocaleKeys.lorem,
    ),
    OnboardingContent(
      image: 'assets/images/onboarding/onboarding2.png',
      title: LocaleKeys.greatExperinceWithOurProduct,
      description: LocaleKeys.lorem,
    ),
    OnboardingContent(
      image: 'assets/images/onboarding/onboarding3.png',
      title: LocaleKeys.getProductFromAtHome,
      description: LocaleKeys.lorem,
    ),
  ];
}
