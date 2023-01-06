
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_check_box.dart';
import '../widgets/custom_text.dart';

class RememberMe extends StatelessWidget {
  bool checkBoxClr;
  RememberMe({Key? key , this.checkBoxClr = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCheckBox(isChecked: checkBoxClr,),
        SizedBox(width: 3.w,),
        CustomText(text: 'Remember me',size: 13,fontWeight: FontWeight.w600,)
      ],
    );
  }
}
