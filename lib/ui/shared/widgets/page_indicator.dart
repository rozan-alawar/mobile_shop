import 'package:flutter/cupertino.dart';
import 'package:mobile_shop/utils/styles/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/models/onboarding_content.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required this.controller,
    required this.content,
    this.width = 10,
    this.height = 10,
    this.raduis = 0,
  }) : super(key: key);

  final PageController controller;
  final List<OnboardingContent> content;
  final double width;
  final double height;
  final double raduis;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: content.length,
      effect: SlideEffect(
        dotHeight: height,
        activeDotColor: ColorManager.primary,
        dotWidth: width,
        radius: raduis,
        dotColor: ColorManager.lightGrey,
      ),
    );
  }
}
