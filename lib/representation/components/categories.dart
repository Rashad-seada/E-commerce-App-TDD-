import 'package:cached_network_image/cached_network_image.dart';
import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_text.dart';

class Categories extends StatelessWidget {
  List categories;
  Categories({Key? key , this.categories = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 1.2/1,
          ),

          itemBuilder: (context,index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  clipBehavior: Clip.hardEdge,
                  width: 14.w,
                  height: 14.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.thirdClr(context)
                  ),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: double.infinity,
                    imageUrl: "https://i.insider.com/602bea612edd0f001a8d5dfe?width=750&format=jpeg&auto=webp",
                    fit: BoxFit.fitHeight,
                    placeholder: (context,url){
                      return const Icon(Icons.image_outlined,size: 60,);
                    },
                  ),
                ),
                SizedBox(height: 0.5.h,),

                CustomText(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  text: 'Women\'s \nCloth',
                  size: 8.sp,
                  fontWeight: FontWeight.w600,
                )

              ],
            );
          }
      ),
    );
  }
}
