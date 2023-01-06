import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_theme.dart';
import '../widgets/custom_text.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Container(
          clipBehavior: Clip.hardEdge,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 10,left: 15,bottom: 10),
          width: 37.w,
          height: 22.h,
          decoration: BoxDecoration(
            color: AppTheme.secClr(context),
            borderRadius: BorderRadius.circular(10),
          ),
          child: CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            imageUrl: "https://m.media-amazon.com/images/I/71H8ipbuxoL._AC_SX569_.jpg",
            fit: BoxFit.fitHeight,
            placeholder: (context,url){
              return const Icon(Icons.image_outlined,size: 60,);
            },
          ),
        ),

        Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                    width: 38.w,
                    child: CustomText(
                      text: 'New Apple iPhone 14 Pro Max (256 GB) - Gold',
                      size: 11.sp,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                    )),
                SizedBox(height:6),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Icon(Icons.star_half_rounded,color: Colors.amber,size: 20,),
                    SizedBox(width: 2,),

                    CustomText(text: '4.7 |   ',size: 10.sp,color: Colors.grey,),

                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(6),

                      decoration: BoxDecoration(
                        color: AppTheme.thirdClr(context),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CustomText(text: '7433 sold',size: 8.sp,),

                    ),

                  ],
                ),
                SizedBox(height: 5,),

                CustomText(text: '\$499.99',size: 12.sp,fontWeight: FontWeight.w600,),

              ],
            ),
        ),


      ],
    );
  }
}
