import 'package:evira/representation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_theme.dart';
import 'mega_deal.dart';

class MegaDeals extends StatelessWidget {
  const MegaDeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.width,
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppTheme.secClr(context),
      ),
      child: Column(
        children: [

          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              CustomText(text: 'Mega  Deals',fontWeight: FontWeight.w900,size: 26),
              Row(
                  children: [
                    const Icon(Icons.access_time,size: 18,),
                    CustomText(text: '  24 hours only',fontWeight: FontWeight.w600,size: 13,),
                  ],
                ),
            ],),
          ),
          SizedBox(height: 0.5.h,),


          Expanded(
            flex: 5,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    MegaDeal(redTicketText: 'LAPTOP DEALS', price: '\$3,199',pastPrice: '\$4,299',),
                    SizedBox(width: 3.w,),
                    MegaDeal(redTicketText: 'SUPERMARKET DEALS',price: '\$80',),
                  ],
                ),
                SizedBox(height: 3.w,),

                Row(
                  children: [
                    MegaDeal(redTicketText: 'TV DEALS',price: '\$14,799',),
                    SizedBox(width: 3.w,),
                    MegaDeal(redTicketText: 'HOME DEALS',price: '\$97',),
                  ],
                ),
              ],
            )
          ),


        ],
      ),
    );
  }
}
