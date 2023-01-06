import 'package:cached_network_image/cached_network_image.dart';
import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_text.dart';

class SubAd extends StatelessWidget {
  const SubAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppTheme.secClr(context),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
            Expanded(
              flex: 4,
              child: Container(
                color: AppTheme.secClr(context),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: double.infinity,
                  imageUrl: "https://pbs.twimg.com/media/Dc3O7ZsXUAAUTwk.jpg",
                  fit: BoxFit.fitHeight,
                  placeholder: (context,url){
                    return const Icon(Icons.image_outlined,size: 60,);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: AppTheme.primClr(context),
               child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Expanded(
                        flex: 1,
                        child: Center(child: CustomText(text: 'UP to 40% off',size: 12.sp,textAlign: TextAlign.center,fontWeight: FontWeight.w600,))),

                    Expanded(
                        flex: 2,
                        child: Center(child: CustomText(text: 'home applicance and other cool things',size: 10.sp,textAlign: TextAlign.center,maxLines: 2,))),
                  ],
               ),
              ),
            )
        ],
      ),
    );
  }
}
