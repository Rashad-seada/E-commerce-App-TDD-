import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_theme.dart';
import '../widgets/sub_ad.dart';

class FirstSubAds extends StatelessWidget {
  const FirstSubAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 15),
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.width,
      height: 21.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppTheme.thirdClr(context),
      ),
      child: Row(
        children: [
          Expanded(child: SubAd()),
          Expanded(child: SubAd()),
        ],
      ),
    );
  }
}
