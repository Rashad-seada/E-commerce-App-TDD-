import 'package:flutter/material.dart';

import 'custom_text.dart';

class HyperText extends StatelessWidget {
  String text;
  String hyperText;
  GestureTapCallback? onTap;
  HyperText({Key? key, this.text = '', this.hyperText = '', this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        CustomText(text: "$text",fontWeight: FontWeight.w400,size: 14,),
        InkWell(
          onTap: onTap,
          child: CustomText(text: "$hyperText",fontWeight: FontWeight.w600,size: 14,),
        )

      ],
    );
  }
}
