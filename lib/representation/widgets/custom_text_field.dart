import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller ;
  String? hintText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextInputType? keyboardType;
  GestureTapCallback? onTap;
  TextInputAction? textInputAction;

  CustomTextField({
    Key? key ,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: 6.5.h,
        decoration: BoxDecoration(
          color: AppTheme.secClr(context),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          validator: (text){
            if(text == '') return 'false';

          },
          onTap: onTap,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          cursorColor: AppTheme.activeClr(context),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 10.sp),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
