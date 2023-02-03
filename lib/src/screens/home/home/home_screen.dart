import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/common%20widgets/loading_indicator.dart';
import 'package:mobile_shop/src/common%20widgets/offer_bannr.dart';
import 'package:mobile_shop/src/utils/styles/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../common widgets/grid_widget.dart';
import '../../../common widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Consumer<HomeDataProvider>(
            builder: (context, provider, child) => provider.isLoading
                ? const LoadingIndiaor()
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p25),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Spaces.heightSpace(AppSize.s10),
                        CarouselSlider(
                          options: CarouselOptions(
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            enlargeCenterPage: true,
                          ),
                          items: provider.banners.map((i) {
                            return OfferBanner(image: i.image!);
                          }).toList(),
                        ),
                        Spaces.heightSpace(AppSize.s24),
                        const SectionHeader(
                            title: 'Popular Item', withSeeAll: true),
                        Spaces.heightSpace(AppSize.s16),
                        GridWidget(
                          provider: provider,
                          list: provider.products,
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
