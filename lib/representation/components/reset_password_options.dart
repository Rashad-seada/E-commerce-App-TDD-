import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_theme.dart';
import '../../config/assets.dart';
import '../blocs/reset_password/reset_password_cubit.dart';
import '../screens/01_auth/04_reset_password_screen.dart';
import '../widgets/custom_text.dart';
import '../widgets/main_button.dart';
import '../widgets/reset_password_options.dart';

class ResetPasswordOptions extends StatelessWidget {
  const ResetPasswordOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return ResetPasswordOption(
              onTap: () {
                context.read<ResetPasswordCubit>().SelectResetMethod(
                    ResetPasswordSMSSelected());
                print(0);
              },
              isSelected: (state is ResetPasswordSMSSelected) ? true : false,
              icon: Icons.chat,
              methodName: "SMS",
              contactAddress: "send rest code over SMS",
            );
          },
        ),

        BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return ResetPasswordOption(
              onTap: () {
                context.read<ResetPasswordCubit>().SelectResetMethod(
                    ResetPasswordEmailSelected());
                print(1);
              },
              isSelected: (state is ResetPasswordEmailSelected) ? true : false,
              icon: Icons.email,
              methodName: "Email",
              contactAddress: "send rest code over E-mail",
            );
          },
        ),
        SizedBox(height: 1.2.h,),

        BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return MainButton(
              color: AppTheme.activeClr(context),
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_)=> (state is ResetPasswordEmailSelected)?
                        ResetPasswordScreen(
                          icon: Icons.email,
                          image: Assets.mail,
                          method: 'E-mail',
                        )
                            : ResetPasswordScreen(
                          icon: Icons.phone,
                          image: Assets.mobile,
                          method: 'Phone Number',
                        )
                    )
                );
              },
              lable: CustomText(
                text: 'Continue',
                size: 12.sp,
                color: AppTheme.primClr(context),
                fontWeight: FontWeight.w600,

              ),
            );
          },
        ),

      ],
    );
  }
}
