import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/common%20widgets/product_details.dart';

import '../core/services/navigation_service.dart';
import '../utils/locator.dart';
import '../router/routes_const.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    required this.list,
    required this.provider,
    Key? key,
  }) : super(key: key);

  final HomeDataProvider provider;
  final List list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.h,
        childAspectRatio: 3.2 / 5,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            provider.product = null;
            provider.getProduct(list[index].id);
            locator<NavigationService>().pushNamed(
              routeName: RouteConstants.productRoute,
            );
          },
          child: ProductDetails(
            product: list[index],
          ),
        );
      },
    );
  }
}
