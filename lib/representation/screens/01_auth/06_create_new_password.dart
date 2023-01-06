import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../config/assets.dart';
import '../../components/remember_me.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/custom_back_bottun.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/main_button.dart';
import '00_login_screen.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({
    Key? key,
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
                CustomBackButton(title: "Create New Password",),
                SizedBox(height: 8.h,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [

                      SvgPicture.asset(
                        Assets.allSet,
                        width: 10.w,
                        height: 25.h,
                      ),

                      SizedBox(height: 7.h,),

                      Row(
                        children: [
                          CustomText(text: 'Create Your New Password',size: 13.sp,fontWeight: FontWeight.w500,),
                        ],
                      ),
                      SizedBox(height: 3.h,),

                      AuthTextField(
                        prefixIcon: Icons.lock,
                        textInputAction: TextInputAction.next,
                        hint: 'Enter New Password',
                          obscure:true,
                      ),
                      SizedBox(height: 2.5.h,),

                      AuthTextField(
                        prefixIcon: Icons.lock,
                        hint: 'Re-Enter Password',
                        obscure:true,
                      ),
                      SizedBox(height: 2.h,),

                      RememberMe(),
                      SizedBox(height: 8.h,),


                      MainButton(
                        color: AppTheme.activeClr(context),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginScreen()));
                        },
                        lable: CustomText(
                          text: 'Continue',
                          size: 16,
                          color: AppTheme.primClr(context),
                          fontWeight: FontWeight.w600,

                        ),
                      ),
                      SizedBox(height: 4.h,),
 

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
