import 'package:evira/representation/components/product.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_text.dart';
import '../widgets/shop_now_button.dart';

class ShopNowSection extends StatelessWidget {
  List items;
  ShopNowSection({Key? key ,required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Hot Deals',size: 13.sp,),
              ShopNowButton()
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),

        SizedBox(
          width: double.infinity,
          height: 35.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)
            {
              return Product();
            }),
        ),
      ],
    );
  }
}
