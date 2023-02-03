import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/src/core/providers/page_provider.dart';
import 'package:mobile_shop/src/common%20widgets/app_bar.dart';
import 'package:mobile_shop/src/common%20widgets/custom_button.dart';
import 'package:mobile_shop/src/utils/enumeration/language.dart';
import 'package:mobile_shop/src/router/routes_const.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/styles_manager.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/navigation_service.dart';
import '../../../../utils/locator.dart';
import '../../../../common widgets/custom_list_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Settings',
        action: [
          SvgPicture.asset('assets/icons/Iconly/Light/Menu.svg'),
          Spaces.widthSpace(AppPadding.p25.w),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
          child: Column(
            children: [
              ActionList(
                image: 'assets/icons/Iconly/Light/Notification.svg',
                title: 'Notification',
                onTap: () => locator<NavigationService>()
                    .pushNamed(routeName: RouteConstants.notificationRoute),
              ),
              Consumer<PageProvider>(
                builder: (context, provider, child) => StatefulBuilder(
                  builder: (context, setState) => ActionList(
                    image: 'assets/icons/Iconly/Light/language.svg',
                    title: 'Language',
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s12.r)),
                        context: context,
                        builder: (context) => Container(
                          padding: const EdgeInsets.all(AppPadding.p25),
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius:
                                  BorderRadius.circular(AppSize.s12.r)),
                          height: 335.h,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Language',
                                style: getSemiBoldStyle(),
                              ),
                              Spaces.heightSpace(AppSize.s10.h),
                              RadioListTile(
                                value: Language.english,
                                groupValue: provider.language,
                                onChanged: (Language? value) =>
                                    provider.changeLanguage(value!),
                                title: const Text('English'),
                              ),
                              RadioListTile(
                                value: Language.arabic,
                                groupValue: provider.language,
                                onChanged: (Language? value) =>
                                    provider.changeLanguage(value!),
                                title: const Text('Arabic'),
                              ),
                              RadioListTile(
                                value: Language.deutsch,
                                groupValue: provider.language,
                                onChanged: (Language? value) =>
                                    provider.changeLanguage(value!),
                                title: const Text('Deutsch'),
                              ),
                              Spaces.heightSpace(AppSize.s24.h),
                              CustomButton(
                                  onPressed: () {
                                    provider.changeLocale(
                                        provider.language, context);
                                    locator<NavigationService>().pop();
                                  },
                                  color: ColorManager.black,
                                  widget: const Text('Save changes'))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              ActionList(
                image: 'assets/icons/Iconly/Light/Scan.svg',
                title: 'Scanner',
                onTap: () {},
              ),
              ActionList(
                image: 'assets/icons/Iconly/Light/help.svg',
                title: 'Help center',
                onTap: () => locator<NavigationService>()
                    .pushNamed(routeName: RouteConstants.helpCenterRoute),
              ),
              ActionList(
                image: 'assets/icons/Iconly/Light/Danger Circle.svg',
                title: 'About us',
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.RIGHSLIDE,
                    title: 'About us',
                    desc:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    btnOkText: 'Close',
                    btnOkColor: ColorManager.lightGrey,
                    buttonsTextStyle: getSemiBoldStyle(),
                    btnOkOnPress: () {},
                  ).show();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
