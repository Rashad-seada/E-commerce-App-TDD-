import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../config/assets.dart';
import '../../blocs/register/register_cubit.dart';
import '../../components/remember_me.dart';
import '../../widgets/custom_back_bottun.dart';
import '../../widgets/custom_chip.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/hyper_text.dart';
import '../../widgets/main_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '02_account_setup_screen.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                CustomBackButton(),
                SizedBox(height: 3.h,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomText(text: 'Create your \nAccount',size: 31.sp,fontWeight: FontWeight.w600,),
                      SizedBox(height: 4.h,),

                      AuthTextField(
                        textInputType: TextInputType.text,
                        hint: 'Enter your Username',
                        lable: 'Username',
                        controller: context.read<RegisterCubit>().nameController,
                        prefixIcon: Icons.person,
                      ),
                      SizedBox(height: 2.5.h,),

                      AuthTextField(
                        textInputType: TextInputType.emailAddress,
                        hint: 'Enter your email',
                        lable: 'Email address',
                        controller: context.read<RegisterCubit>().emailController,
                        prefixIcon: Icons.mail,
                      ),
                      SizedBox(height: 2.5.h,),

                      AuthTextField(
                          textInputAction: TextInputAction.done,
                          obscure: true,
                          hint: 'Enter your password',
                          lable: 'Password',
                          controller: context.read<RegisterCubit>().passwordController,
                          prefixIcon: Icons.lock
                      ),
                      SizedBox(height: 2.5.h,),

                      RememberMe(),
                      SizedBox(height: 2.5.h,),

                      MainButton(
                        color: AppTheme.activeClr(context),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=> AccountSetupScreen())),
                        lable: CustomText(
                          text: 'Sign up',
                          size: 16,
                          color: AppTheme.primClr(context),
                          fontWeight: FontWeight.w600,

                        ),
                      ),
                      SizedBox(height: 3.h,),

                      CustomDivider(lable: 'or continue with',),
                      SizedBox(height: 3.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          CustomChip(
                            lable: SvgPicture.asset(Assets.facebookLogo),
                          ),

                          CustomChip(
                            lable: SvgPicture.asset(Assets.googleLogo),
                          ),

                          CustomChip(
                            lable: SvgPicture.asset(Assets.appleLogo(context)),
                          ),

                        ],
                      ),
                      SizedBox(height: 7.h,),
                    ],
                  ),
                ),

                HyperText(text: 'Already have an account?  ', hyperText: 'Sign in',onTap: (){
                  Navigator.pop(context);
                },),
                SizedBox(height: 5.h,),

              ],
            ),
          ),
        ));
  }

}

