import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/src/data/models/onboarding_content.dart';
import 'package:mobile_shop/src/core/services/navigation_service.dart';
import 'package:mobile_shop/src/common%20widgets/custom_button.dart';
import 'package:mobile_shop/src/common%20widgets/title_text.dart';
import 'package:mobile_shop/src/utils/locator.dart';
import 'package:mobile_shop/src/router/routes_const.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import '../../localization/locale_keys.g.dart';
import '../../common widgets/page_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../common widgets/sub_title.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
                child: MyPageView(
                  controller: controller,
                  content: OnboardingContent.content,
                ),
              ),
              _currentPage == 2
                  ? CustomButton(
                      height: 42.h,
                      width: 136.w,
                      raduis: AppSize.s22.r,
                      onPressed: () {
                        locator<NavigationService>()
                            .pushReplacementNamed(RouteConstants.signupRoute);
                      },
                      widget: Text(LocaleKeys.getStarted.tr()),
                    )
                  : CustomButton(
                      isCircularButton: true,
                      onPressed: () {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                      widget: SvgPicture.asset(
                        LocaleKeys.arrowIcon.tr(),
                        color: ColorManager.white,
                      ),
                    ),
              Spaces.heightSpace(70.h)
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
    return SizedBox(
      child: PageView.builder(
        controller: controller,
        itemCount: content.length,
        itemBuilder: (context, index) => Column(
          children: [
            SizedBox(
              height: 413.h,
              child: Image.asset(content[index].image),
            ),
            Spaces.heightSpace(AppSize.s40.h),
            PageIndicator(controller: controller, content: content),
            Spaces.heightSpace(AppSize.s40.h),
            TitleText(text: content[index].title.tr()),
            Spaces.heightSpace(AppSize.s20.h),
            SubTitle(text: content[index].description.tr(), fontSize: 16.sp),
          ],
        ),
      ),
    );
  }
}
