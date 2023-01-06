import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_theme.dart';
import 'custom_text.dart';

class ResetPasswordOption extends StatelessWidget {
  bool isSelected;
  IconData icon;
  String methodName;
  String contactAddress;
  GestureTapCallback? onTap;
  ResetPasswordOption({Key? key , this.isSelected = false , required this.icon ,required this.methodName,required this.contactAddress, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 14.h,
      decoration: BoxDecoration(
          border: Border.all(width: (isSelected == true)? 1.7 : 0,color:(isSelected == true)? AppTheme.activeClr(context): Colors.grey),
          borderRadius: BorderRadius.circular(15)
      ),
      duration: const Duration(milliseconds: 400),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppTheme.secClr(context),
              radius: 40,
              child: Icon(
                icon,
                color: AppTheme.activeClr(context),
                size: 35,
              ),
            ),
            const SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'via $methodName' ,size: 10.sp,color: Colors.grey,),
                const SizedBox(height: 8,),
                CustomText(text: '$contactAddress' ,size: 11.sp,fontWeight: FontWeight.w600,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
