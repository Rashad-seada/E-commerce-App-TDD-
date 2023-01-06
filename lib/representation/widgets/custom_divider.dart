import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_theme.dart';
import 'custom_text.dart';

class CustomDivider extends StatelessWidget {
  String lable;

  CustomDivider({Key? key ,required this.lable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Expanded(child: Divider(
          thickness: .8,
          color: Colors.grey,
        )),

        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomText(text: lable,size: 11.sp,fontWeight: FontWeight.w600,),
        ),

        Expanded(child: Divider(
          thickness: .8,
          color: Colors.grey,
        )),

      ],
    );
  }
}
