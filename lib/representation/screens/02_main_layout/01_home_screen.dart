import 'package:evira/config/app_theme.dart';
import 'package:evira/representation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../blocs/home/home_cubit.dart';
import '../../components/ad_banner.dart';
import '../../components/categories.dart';
import '../../components/search_bar.dart';
import '../../components/mega_deals.dart';
import '../../components/profile_bar.dart';
import '../../components/second_sub_ads.dart';
import '../../components/shop_now_section.dart';
import '../../components/first_sub_ads.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.primClr(context),
            titleSpacing: 5.w,
            expandedHeight: 16.5.h,
            pinned: true,
            floating: false,
            bottom: PreferredSize(                       // Add this code
              preferredSize: Size.fromHeight(2.h),      // Add this code
              child: SearchBar(),                           // Add this code
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: ProfileBar(),
              collapseMode: CollapseMode.pin,
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 0,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 5,
            ),
            AdBanner(
              ads: HomeCubit.Instanse.ads,
            ),
            const SizedBox(
              height: 20,
            ),
            Categories(
              categories: const [1, 2, 3, 4, 1, 1, 1, 1, 1, 1, 1, 1],
            ),
            const SizedBox(
              height: 25,
            ),
            const FirstSubAds(),
            const SizedBox(
              height: 13,
            ),
            ShopNowSection(
              items: const [1, 2, 3, 1, 1],
            ),
            const SizedBox(
              height: 5,
            ),
            MegaDeals(),
            const SizedBox(
              height: 13,
            ),
            ShopNowSection(
              items: const [1, 2, 3, 1, 1],
            ),
            const SecondSubAds(),
          ])),
        ],
      ),
    ));
  }
}
