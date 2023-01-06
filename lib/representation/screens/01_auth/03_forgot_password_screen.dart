import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../config/assets.dart';
import '../../components/reset_password_options.dart';
import '../../widgets/custom_back_bottun.dart';
import '../../widgets/custom_text.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [

            SizedBox(height: 3.3.h,),
            CustomBackButton(title: 'Forgot Password',),
            SizedBox(height: 3.3.h,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [

                  SvgPicture.asset(
                      Assets.forgotPasswordIL(context),
                      width: 60.w,
                      height: 28.h,
                  ),
                  SizedBox(height: 3.3.h,),

                  CustomText(text: 'Select which contact details should we use to reset your password',size: 13.sp,fontWeight: FontWeight.w500,),
                  SizedBox(height: 3.3.h,),

                  const ResetPasswordOptions()


                ],
              ),
            )

          ],
        ),
      ),
    ));
  }
}
