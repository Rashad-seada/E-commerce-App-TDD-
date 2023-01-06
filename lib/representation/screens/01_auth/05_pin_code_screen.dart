import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/custom_back_bottun.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/hyper_text.dart';
import '../../widgets/main_button.dart';
import '../../widgets/pin_code_field.dart';
import '06_create_new_password.dart';

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({
    Key? key ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [

                SizedBox(height: 3.3.h,),
                CustomBackButton(title: "Pin Code",),
                SizedBox(height: 5.h,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [

                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                              'CODE',
                              speed: const Duration(milliseconds: 300),
                              textStyle: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 60.sp,
                                    fontWeight: FontWeight.w600,
                                  )
                              ),
                          )
                        ],
                        repeatForever: true,
                      ),
                      SizedBox(height: 7.h,),

                      CustomText(text: 'Verification',size: 20.sp,fontWeight: FontWeight.w600,),
                      SizedBox(height: 2.h,),

                      CustomText(text: 'Enter the code that has been sent to\n+1 111 *****99',size: 13.sp,fontWeight: FontWeight.w500,textAlign: TextAlign.center,),
                      SizedBox(height: 7.h,),

                      SizedBox(
                          height: 12.h,
                          child: const PinCodeField()
                      ),
                      SizedBox(height: 5.h,),

                      MainButton(
                        color: AppTheme.activeClr(context),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> const  CreateNewPasswordScreen()));
                        },
                        lable: CustomText(
                          text: 'Verify',
                          size: 16,
                          color: AppTheme.primClr(context),
                          fontWeight: FontWeight.w600,

                        ),
                      ),
                      SizedBox(height: 3.h,),

                      HyperText(text: 'Didn\'t receive code?', hyperText: '  Resend',onTap: (){
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