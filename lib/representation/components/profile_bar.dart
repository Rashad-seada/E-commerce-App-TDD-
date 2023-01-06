import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_text.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
      child: SizedBox(
        height: 8.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppTheme.secClr(context),
              radius: 6.w,
            ),
            SizedBox(width: 3.w,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(
                  height: 0.5.h,
                ),
                CustomText(
                  text: 'Good morning    👋',
                  size: 10.sp,
                  fontWeight: FontWeight.w400,

                ),
                SizedBox(
                  height: 0.2.h,
                ),
                CustomText(
                  text: 'Mr. Rashad Seada ',
                  size: 12.sp,
                  fontWeight: FontWeight.w600,

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
