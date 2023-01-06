import 'package:cached_network_image/cached_network_image.dart';
import 'package:evira/representation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_theme.dart';

class MegaDeal extends StatelessWidget {
  String redTicketText;
  String? pastPrice;
  String price;

  MegaDeal({
    Key? key,
    required this.redTicketText,
    required this.price,
    this.pastPrice
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 2.w,
        height: 12.9.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppTheme.primClr(context),
        ),
        child: Column(
          children: [

            //RED TICKET
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 1),
                  height: 2.2.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
                    color: Colors.pink,
                  ),
                  child: CustomText(text: redTicketText,size: 7.sp,fontWeight: FontWeight.w600,color: Colors.white,),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 1.w,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'I Am one of themost famous people',size: 7.sp,fontWeight: FontWeight.w600,maxLines: 4,),

                      SizedBox(height: 1.h,),
                      CustomText(text: (pastPrice == null)? 'From' : pastPrice!,size: 9.sp,fontWeight: FontWeight.w500,color: (pastPrice == null)? Colors.pinkAccent: Colors.grey,textDecoration: (pastPrice == null)? null:TextDecoration.lineThrough,),

                      SizedBox(height: 0.4.h,),
                      CustomText(text: price,size: 11.sp,fontWeight: FontWeight.w700,),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                      width: 20.w,height: 10.h,
                      child: CachedNetworkImage(
                        width: double.infinity,
                        height: double.infinity,
                        imageUrl: "https://images.samsung.com/is/image/samsung/eg-fhd-t5300-ua43t5300auxeg-rperspectiveblack-254763435?\$684_547_PNG\$",
                        fit: BoxFit.fitHeight,
                        placeholder: (context,url){
                          return const Icon(Icons.image_outlined,size: 60,);
                        },
                      ),
                  ),
                ),
                SizedBox(width: 2.w,),

              ],
            )
            //DEALS ITEM NAME

          ],
        ),
      ),
    );
  }
}
