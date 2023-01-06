import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCheckBox extends StatefulWidget {
  bool isChecked;
  CustomCheckBox({Key? key , this.isChecked = false}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: (){
        widget.isChecked = !widget.isChecked;
        setState(() {});
      },
      child: AnimatedContainer(
        alignment: Alignment.center,
        width: 6.w,
        height: 6.w,
        decoration: BoxDecoration(
          color: (widget.isChecked)? AppTheme.checkBoxClr(context) : Colors.transparent,
          border: Border.all(color: AppTheme.checkBoxClr(context),width: 3),
          borderRadius: BorderRadius.circular(8),
        ),
        duration: Duration(milliseconds: 200),
        child: (widget.isChecked)? Icon(Icons.done_rounded,size: 2.h,color: AppTheme.invertedClr(context),) : null,
      ),
    );
  }
}
