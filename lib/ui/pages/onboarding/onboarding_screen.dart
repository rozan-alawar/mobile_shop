import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/core/models/onboarding_content.dart';
import 'package:mobile_shop/core/services/navigation_service.dart';
import 'package:mobile_shop/ui/shared/widgets/custom_button.dart';
import 'package:mobile_shop/utils/locator.dart';
import 'package:mobile_shop/utils/routes/routes_const.dart';
import 'package:mobile_shop/utils/styles/color_manager.dart';
import 'package:mobile_shop/utils/styles/font_manager.dart';
import 'package:mobile_shop/utils/styles/styles_manager.dart';
import '../../../utils/l10n/locale_keys.g.dart';
import '../../shared/widgets/page_indicator.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingContent> content = [
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

  final controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        _currentPage = controller.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: MyPageView(controller: controller, content: content),
              ),
              _currentPage == 2
                  ? CustomButton(
                      height: 42.h,
                      width: 136.w,
                      shap: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      onPressed: () {
                        locator<NavigationService>()
                            .pushReplacementNamed(signupRoue);
                      },
                      widget: Text(
                        LocaleKeys.getStarted.tr(),
                        style: getSemiBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    )
                  : CustomButton(
                      shap: const CircleBorder(),
                      onPressed: () {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                      widget: Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          LocaleKeys.arrowIcon.tr(),
                          color: ColorManager.white,
                        ),
                      ),
                    ),
              SizedBox(height: 70.h),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPageView extends StatelessWidget {
  const MyPageView({
    Key? key,
    required this.controller,
    required this.content,
  }) : super(key: key);

  final PageController controller;
  final List<OnboardingContent> content;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: content.length,
      itemBuilder: (context, index) => Column(
        children: [
          SizedBox(height: 413.h, child: Image.asset(content[index].image)),
          SizedBox(height: 40.h),
          PageIndicator(controller: controller, content: content),
          SizedBox(height: 40.h),
          Text(
            content[index].title.tr(),
            style: getBoldStyle(
              color: ColorManager.black,
              fontSize: FontSize.s22,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
            child: Text(
              content[index].description.tr(),
              style: getRegularStyle(
                color: ColorManager.grey,
                fontSize: FontSize.s16,
              ).copyWith(color: ColorManager.primary),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
