import 'package:evira/representation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_theme.dart';

class SearchBar extends StatelessWidget {
  TextInputType textInputType;
  SearchBar({Key? key ,this.textInputType =TextInputType.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,bottom: 12),
      alignment: Alignment.center,
        height: 5.8.h,
        decoration: BoxDecoration(
          color: AppTheme.secClr(context),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            SizedBox(width: 3.w,),
            Icon(Icons.search,size: 20,color: Colors.grey,),
            SizedBox(width: 2.w,),
            CustomText(text: 'What are you looking for?',size: 10.sp,fontWeight: FontWeight.w400,color: Colors.grey,)
          ],
        )
      );
  }
}

