import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/home_data_provider.dart';
import '../../../utils/styles/color_manager.dart';
import '../../../utils/styles/values_manager.dart';
import '../../../common widgets/offer_bannr.dart';
import '../../../common widgets/product_details.dart';
import '../../../common widgets/section_header.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Consumer<HomeDataProvider>(
            builder: (context, provider, child) => provider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p25),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Spaces.heightSpace(AppSize.s10),
                        CarouselSliderWidget(provider: provider),
                        Spaces.heightSpace(AppSize.s24),
                        const SectionHeader(
                          title: 'Best Seller',
                          withSeeAll: true,
                        ),
                        Spaces.heightSpace(AppSize.s16),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15.w,
                            mainAxisSpacing: 15.h,
                            childAspectRatio: 3.2 / 5,
                          ),
                          itemBuilder: (context, index) => ProductDetails(
                            product: provider.products[index],
                          ),
                        ),
                        // Spaces.heightSpace(AppSize.s24),
                        const SectionHeader(
                          title: 'Top Trends',
                          withSeeAll: true,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: provider.products.length,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15.w,
                            mainAxisSpacing: 15.h,
                            childAspectRatio: 3.2 / 5,
                          ),
                          itemBuilder: (context, index) => ProductDetails(
                            product: provider.products[index],
                          ),
                        ),
                        Spaces.heightSpace(AppSize.s24),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({Key? key, required this.provider})
      : super(key: key);
  final HomeDataProvider provider;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 3000),
        enlargeCenterPage: true,
      ),
      items: provider.banners.map((i) {
        return OfferBanner(image: i.image!);
      }).toList(),
    );
  }
}
