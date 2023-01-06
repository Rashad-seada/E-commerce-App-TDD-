import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_theme.dart';
import 'custom_text.dart';

class ShopNowButton extends StatelessWidget {
  GestureTapCallback? onTap;
  ShopNowButton({Key? key , this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: CustomText(text: 'Shop Now',size: 10.sp,),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1,color: AppTheme.activeClr(context)),
        ),
      ),
    );

  }
}
