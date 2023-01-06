import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_theme.dart';
import '../blocs/home/home_cubit.dart';
import '../widgets/custom_text.dart';
import '../widgets/hyper_text.dart';

class AdBanner extends StatelessWidget {
  List ads;
  AdBanner({Key? key, this.ads = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Special Offers',size: 12.sp,),
              HyperText(hyperText: 'See All',)
            ],
          ),
          SizedBox(height: 13,),
          Container(
                  clipBehavior: Clip.hardEdge,
                  width: MediaQuery.of(context).size.width,
                  height: 18.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppTheme.thirdClr(context),
                  ),
                  child: Swiper(
                    onIndexChanged: (index){
                      HomeCubit.Instanse.adPageIndex = index;
                    },
                    itemCount: ads.length,
                    controller: HomeCubit.Instanse.swiperController,
                    autoplay: true,
                    indicatorLayout: PageIndicatorLayout.SCALE,
                    pagination: SwiperPagination(
                        builder: SwiperPagination.dots,

                    ),

                    itemBuilder: (BuildContext context, int index) {
                      return CachedNetworkImage(
                        imageUrl: "${ads[index]}",
                        fit: BoxFit.fitHeight,
                        placeholder: (context,url){
                          return const Icon(Icons.image_outlined,size: 60,);
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
