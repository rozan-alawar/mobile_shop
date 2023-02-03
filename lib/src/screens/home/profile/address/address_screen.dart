import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/src/core/providers/map_provider.dart';
import 'package:mobile_shop/src/screens/home/profile/address/new_address.dart';
import 'package:mobile_shop/src/common%20widgets/app_bar.dart';
import 'package:mobile_shop/src/common%20widgets/custom_button.dart';
import 'package:mobile_shop/src/common%20widgets/loading_indicator.dart';
import 'package:mobile_shop/src/common%20widgets/sub_title.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/styles_manager.dart';
import 'package:provider/provider.dart';

import '../../../../utils/styles/values_manager.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Shipping Address',
        action: [
          SvgPicture.asset('assets/icons/Iconly/Light/Menu.svg'),
          Spaces.widthSpace(AppPadding.p25.w),
        ],
      ),
      body: Consumer<MapProvider>(
        builder: (context, provider, child) => provider.addresses.isEmpty
            ? const LoadingIndiaor()
            : Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.addresses.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p25.w,
                          vertical: AppPadding.p14.h),
                      child: Container(
                        width: 325.w,
                        height: 250.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s6.r),
                          color: ColorManager.white,
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Container(
                                width: AppSize.s40.w,
                                height: AppSize.s40.h,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s6.r),
                                  color: ColorManager.lightGrey,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/basic/location.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              title: Text(
                                provider.addresses[index].name!,
                                style: getSemiBoldStyle(),
                              ),
                              subtitle: FittedBox(
                                child: SubTitle(
                                  text:
                                      '${provider.addresses[index].city}  - ${provider.addresses[index].region} - ${provider.addresses[index].details}',
                                ),
                              ),
                              trailing: SvgPicture.asset(
                                'assets/icons/basic/radio_filled.svg',
                                color: ColorManager.primary,
                              ),
                            ),
                            const Divider(),
                            // GoogleMapAddress(provider: provider, index: index),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                      color: Colors.transparent,
                      borderColor: ColorManager.grey,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const AddNewAddress());
                      },
                      widget: Text(
                        '+',
                        style: getBoldStyle(
                          color: ColorManager.grey,
                        ),
                      )),
                  const Spacer(),
                  CustomButton(
                    color: ColorManager.black,
                    onPressed: () {},
                    widget: const Text('Continue to payment'),
                  ),
                  Spaces.heightSpace(AppSize.s20.h)
                ],
              ),
      ),
    );
  }
}
