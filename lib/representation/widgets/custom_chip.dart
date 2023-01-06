import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomChip extends StatelessWidget {
  Widget? lable;
  GestureTapCallback? onTap;
  CustomChip({Key? key , this.lable, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 28),

        width: 20.w,
        height: 6.8.h,
        decoration: BoxDecoration(
          color: AppTheme.secClr(context),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey,width: .1),
        ),
        child: lable,
      ),
    );
  }
}
