import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class MainButton extends StatelessWidget {
  Color? color;
  Widget? lable;
  GestureTapCallback? onTap;
  MainButton({Key? key ,required this.color, this.lable, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.h/2),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 7.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.h/2),
          boxShadow: [
            BoxShadow(
              color: AppTheme.deActiveClr(context).withOpacity(.35),
              offset: Offset(5, 10),
              spreadRadius: 10,
              blurRadius: 30,
            )
          ]
        ),
        child: lable,
      ),
    );
  }
}
