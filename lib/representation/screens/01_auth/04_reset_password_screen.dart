import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/custom_back_bottun.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/hyper_text.dart';
import '../../widgets/main_button.dart';
import '00_login_screen.dart';
import '05_pin_code_screen.dart';

class ResetPasswordScreen extends StatelessWidget {

  String image;
  String method;
  IconData icon;
  ResetPasswordScreen({
    Key? key ,
    required this.image,
    required this.method,
    required this.icon
  }) : super(key: key);

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
                CustomBackButton(title: "Rest by $method",),
                SizedBox(height: 3.h,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [

                      SvgPicture.asset(
                        image ,
                        width: 10.w,
                        height: 22.h,
                      ),

                      SizedBox(height: 5.h,),

                      CustomText(text: 'Please enter the $method that is connected to your account',size: 13.sp,fontWeight: FontWeight.w500,),
                      SizedBox(height: 3.h,),

                      AuthTextField(
                          prefixIcon: icon,
                          hint: 'Enter your $method'),
                      SizedBox(height: 3.h,),

                      MainButton(
                        color: AppTheme.activeClr(context),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>  PinCodeScreen()));
                        },
                        lable: CustomText(
                          text: 'Verify',
                          size: 16,
                          color: AppTheme.primClr(context),
                          fontWeight: FontWeight.w600,

                        ),
                      ),
                      SizedBox(height: 26.h,),

                      HyperText(text: 'Already have an account?  ', hyperText: 'Sign in',onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const LoginScreen()));
                      },),
                      SizedBox(height: 2.h,),

                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
