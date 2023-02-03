import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/common%20widgets/loading_indicator.dart';
import 'package:mobile_shop/src/common%20widgets/sub_title.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/font_manager.dart';
import 'package:mobile_shop/src/utils/styles/styles_manager.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../core/services/snack_bar_service.dart';
import '../../../data/models/carts.dart';
import '../../../utils/locator.dart';
import '../../../common widgets/custom_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.cartItem}) : super(key: key);
  final CartItems? cartItem;
  @override
  Widget build(BuildContext context) => cartItem != null
      ? Column(
          children: [
            SizedBox(
              width: 325.w,
              height: 100.h,
              child: Slidable(
                key: UniqueKey(),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    Consumer<HomeDataProvider>(
                      builder: (context, provider, child) => Center(
                        child: InkWell(
                          onTap: () => cartItem!.product!.inCart == true
                              ? provider.addToCart(cartItem!.product!.id!)
                              : locator<SnackBarSrevie>()
                                  .showSnackBar('product removed from cart'),
                          child: Container(
                            width: 44.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              color: ColorManager.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/Iconly/Light/Delete.svg',
                              color: ColorManager.white,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                endActionPane:
                    ActionPane(motion: const ScrollMotion(), children: [
                  Spaces.widthSpace(20),
                  CustomButton(
                    width: 120.w,
                    height: AppSize.s44.h,
                    onPressed: () {},
                    raduis: 50,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove),
                        ),
                        Text(cartItem!.quantity!.toString()),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        )
                      ],
                    ),
                  ),
                ]),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  width: 325.w,
                  height: 100.h,
                  child: Row(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: ColorManager.lightGrey,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: cartItem!.product!.image!,
                            fit: BoxFit.fill,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Spaces.widthSpace(AppSize.s10.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150.w,
                            height: 40,
                            child: Text(
                              cartItem!.product!.name!,
                              style: getSemiBoldStyle(),
                            ),
                          ),
                          SubTitle(text: 'ID: ${cartItem!.product!.id!}'),
                          Text(
                            '${cartItem!.product!.price} AED',
                            style: getSemiBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s14),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        'x${cartItem!.quantity!}',
                        style: getSemiBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s14),
                      ),
                      Spaces.widthSpace(AppSize.s16.w)
                    ],
                  ),
                ),
              ),
            ),
            Spaces.heightSpace(20),
          ],
        )
      : const LoadingIndiaor();
}
