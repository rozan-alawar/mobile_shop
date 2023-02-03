import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/data/models/products.dart';
import 'package:mobile_shop/src/common%20widgets/product/discount.dart';
import 'package:mobile_shop/src/common%20widgets/rating_widget.dart';
import 'package:provider/provider.dart';

import '../utils/styles/color_manager.dart';
import '../utils/styles/font_manager.dart';
import '../utils/styles/styles_manager.dart';
import '../utils/styles/values_manager.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 244.h,
      width: 155.w,
      child: Card(
        elevation: 5,
        shadowColor: ColorManager.lightGrey,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ListTile(
                leading: product.discount == 0 || product.discount == null
                    ? const SizedBox()
                    : DiscountNumber(discount: product.discount),
                trailing: Consumer<HomeDataProvider>(
                  builder: (context, value, child) => IconButton(
                    onPressed: () {
                      value.addToFvorite(product);
                    },
                    icon: product.inFavorites ?? true
                        ? CircleAvatar(
                            backgroundColor: ColorManager.primary,
                            child: Image.asset(
                              'assets/icons/Iconly/Bold/Heart.png',
                              width: 14.w,
                              height: 14.h,
                              color: ColorManager.white,
                            ),
                          )
                        : Image.asset(
                            'assets/icons/Iconly/Light/Heart.png',
                            width: 15.w,
                            height: 15.h,
                          ),
                  ),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                key: UniqueKey(),
                imageUrl: product.image ?? "",
                fit: BoxFit.contain,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Spaces.heightSpace(AppSize.s8),
            SizedBox(
              width: 100.w,
              child: Text(
                product.name ?? "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: getSemiBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s17.sp,
                ),
              ),
            ),
            Spaces.heightSpace(AppSize.s8),
            Text(
              '${product.price} USD',
              style: getSemiBoldStyle(
                color: ColorManager.primary,
                fontSize: FontSize.s12.sp,
              ),
            ),
            Spaces.heightSpace(AppSize.s8),
            const Rating(),
          ],
        ),
      ),
    );
  }
}
