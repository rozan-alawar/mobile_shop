import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:provider/provider.dart';

import '../../../common widgets/product_details.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Consumer<HomeDataProvider>(
        builder: (context, provider, child) => RefreshIndicator(
          onRefresh: () => provider.getFAvoriteData(),
          child: GridView.builder(
            itemCount: provider.favorites.length,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 5.h,
              childAspectRatio: 3.2 / 5,
            ),
            itemBuilder: (context, index) => SizedBox(
              height: 300.h,
              child:
                  ProductDetails(product: provider.favorites[index].product!),
            ),
          ),
        ),
      ),
    );
  }
}
