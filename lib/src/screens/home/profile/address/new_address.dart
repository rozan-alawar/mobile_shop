import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/styles/color_manager.dart';
import '../../../../utils/styles/styles_manager.dart';
import '../../../../utils/styles/values_manager.dart';
import '../../../../common widgets/custom_button.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add the shipping address',
          style: getSemiBoldStyle(),
        ),
        Spaces.heightSpace(AppSize.s10.h),
        Spaces.heightSpace(AppSize.s24.h),
        CustomButton(
            onPressed: () {},
            color: ColorManager.black,
            widget: const Text('Save'))
      ],
    );
  }
}
