import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/common%20widgets/custom_button.dart';
import 'package:mobile_shop/src/common%20widgets/sub_title.dart';
import 'package:mobile_shop/src/screens/home/cart/product_card.dart';
import 'package:mobile_shop/src/utils/styles/color_manager.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:provider/provider.dart';

class ShopingCartScreen extends StatelessWidget {
  const ShopingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<HomeDataProvider>(
        builder: (context, provider, child) => provider.cartItems.isEmpty
            ? const Text('no data')
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 400.h,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: provider.cartItems.length,
                        itemBuilder: (context, index) => ProductCard(
                          cartItem: provider.cartItems[index],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 274.h,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const SubTitle(text: 'SubTotal'),
                              trailing: Text(
                                '${provider.carts!.subTotal!} AED',
                              ),
                            ),
                            Image.asset('assets/images/component/line.png'),
                            Spaces.heightSpace(AppSize.s16.h),
                            ListTile(
                              leading: const SubTitle(text: 'Total'),
                              trailing: Text(
                                '\$${provider.carts!.total!}',
                              ),
                            ),
                            Spaces.heightSpace(AppSize.s32.h),
                            CustomButton(
                              onPressed: () {},
                              color: ColorManager.lightBlack,
                              widget: const Text('Proceed to checkout'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
