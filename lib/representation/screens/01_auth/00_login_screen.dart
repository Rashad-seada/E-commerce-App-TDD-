import 'package:evira/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../config/assets.dart';
import '../../blocs/login/login_cubit.dart';
import '../../components/remember_me.dart';
import '../../widgets/custom_back_bottun.dart';
import '../../widgets/custom_chip.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/hyper_text.dart';
import '../../widgets/main_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../02_main_layout/00_main_layout.dart';
import '01_register_screen.dart';
import '03_forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                SizedBox(height: 5.h,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomText(text: 'Login to your\nAccount',size: 31.sp,fontWeight: FontWeight.w600,),
                      SizedBox(height: 6.5.h,),

                      AuthTextField(
                        textInputType: TextInputType.emailAddress,
                        hint: 'Enter your email',
                        lable: 'Email address',
                        controller: context.read<LoginCubit>().emailController,
                        prefixIcon: Icons.mail,
                      ),
                      SizedBox(height: 2.5.h,),

                      AuthTextField(
                          textInputAction: TextInputAction.done,
                          obscure: true,
                          hint: 'Enter your password',
                          lable: 'Password',
                          controller: context.read<LoginCubit>().passwordController,
                          prefixIcon: Icons.lock
                      ),
                      SizedBox(height: 2.5.h,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          HyperText(
                            hyperText: 'Forgoten Password?',
                            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> ForgotPasswordScreen()))

                          ),

                          RememberMe(),

                        ],
                      ),
                      SizedBox(height: 2.5.h,),

                      MainButton(
                        color: AppTheme.activeClr(context),
                        onTap: ()=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> MainLayout()), (route) => false),

                        lable: CustomText(
                          text: 'Sign in',
                          size: 16,
                          color: AppTheme.primClr(context),
                          fontWeight: FontWeight.w600,

                        ),
                      ),
                      SizedBox(height: 7.2.h,),

                      CustomDivider(lable: 'or continue with',),
                      SizedBox(height: 3.h,),

                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                CustomChip(
                                  onTap: context.read<LoginCubit>().facebookSignIn(),
                                  lable: SvgPicture.asset(Assets.facebookLogo),
                                ),

                                CustomChip(
                                  onTap: context.read<LoginCubit>().googleSignIn(),
                                  lable: SvgPicture.asset(Assets.googleLogo),
                                ),

                                CustomChip(
                                  onTap: context.read<LoginCubit>().appleSignIn(),
                                  lable: SvgPicture.asset(Assets.appleLogo(context)),
                                ),

                              ],
                        );
                        },
                      ),
                      SizedBox(height: 7.h,),

                    ],
                  ),
                ),

                HyperText(text: 'Don\'t have an account?  ', hyperText: 'Sign up',onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const RegisterScreen()));
                },),
                SizedBox(height: 5.h,),

              ],
            ),
          ),
        ));
  }
}
