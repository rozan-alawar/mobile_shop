import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/common%20widgets/custom_text_field.dart';
import 'package:mobile_shop/src/common%20widgets/loading_indicator.dart';
import 'package:mobile_shop/src/common%20widgets/section_header.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/navigation_service.dart';
import '../../../../utils/locator.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => locator<NavigationService>().pop(),
          child: SvgPicture.asset(
            'assets/icons/Iconly/Light/Arrow - Left 2.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      body: Consumer<HomeDataProvider>(
        builder: (context, provider, child) => provider.quastions.isEmpty
            ? const LoadingIndiaor()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionHeader(
                        title: 'Do you have any quesiton?',
                      ),
                      Spaces.heightSpace(AppSize.s16.h),
                      CustomTextField(
                        controller: controller,
                        hintText: 'for topics or questions',
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/Iconly/Light/Search.svg',
                          color: ColorManager.grey,
                        ),
                        validator: (p0) {
                          return null;
                        },
                      ),
                      Spaces.heightSpace(AppSize.s32.h),
                      const SectionHeader(
                        title: 'Frequently Asked',
                        withSeeAll: true,
                      ),
                      Spaces.heightSpace(AppSize.s16.h),
                      QuestionTile(provider: provider),
                      Spaces.heightSpace(AppSize.s32.h),
                      const SectionHeader(
                        title: 'Topics',
                        withSeeAll: true,
                      ),
                      Spaces.heightSpace(AppSize.s16.h),
                      QuestionTile(provider: provider),
                      Spaces.heightSpace(AppSize.s32.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Material(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSize.s6.r),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(AppSize.s6),
                              child: Text('Start a conversation'),
                            ),
                          ),
                          Spaces.widthSpace(AppSize.s8.w),
                          SvgPicture.asset(
                            'assets/icons/Iconly/chat.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ],
                      ),
                      Spaces.heightSpace(AppSize.s32.h),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    Key? key,
    required this.provider,
  }) : super(key: key);
  final HomeDataProvider provider;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: provider.quastions.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: AppPadding.p16.h),
        child: Material(
          color: ColorManager.white,
          child: ExpansionTile(
            expandedAlignment: Alignment.centerLeft,
            childrenPadding: EdgeInsets.all(AppPadding.p25.w),
            title: Text(provider.quastions[index].question!),
            children: [Text(provider.quastions[index].answer!)],
          ),
        ),
      ),
    );
  }
}
