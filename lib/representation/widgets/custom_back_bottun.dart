import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_text.dart';

class CustomBackButton extends StatelessWidget {

  String title ;
  CustomBackButton({Key? key , this.title = "" }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_rounded,size: 25.sp,)),
        SizedBox(width: 4.w,),

        CustomText(text: title,size: 22,fontWeight: FontWeight.w600,),

      ],
    );
  }
}
