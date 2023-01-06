import 'package:flutter/material.dart';
import '../../config/app_theme.dart';
import 'custom_text.dart';

class ImagePickOption extends StatelessWidget {
  BuildContext context;
  String text;
  IconData icon;
  GestureTapCallback? onTap;
  ImagePickOption(this.context,{Key? key,required this.text,required this.icon,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.pop(context);
          onTap!();

        },
        child: Column(
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
            SizedBox(height: 6,),
            CustomText(text: text ,size: 14,),
          ],
        )
    );
  }
}
