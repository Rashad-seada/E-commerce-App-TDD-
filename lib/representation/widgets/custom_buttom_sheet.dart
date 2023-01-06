import 'package:flutter/material.dart';

import '../../config/app_theme.dart';

showCustomBottomSheet(BuildContext context,{required Widget child}){
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.4),
      elevation: 0.0,
      builder: (_){
        return Container(
          height: 200,
          decoration: BoxDecoration(
              color: AppTheme.primClr(context),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),)
          ),
          child: child
        );
      });
}