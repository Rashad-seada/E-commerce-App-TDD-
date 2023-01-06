import 'package:evira/representation/blocs/account_setup/account_setup_cubit.dart';
import 'package:evira/representation/blocs/categories/categories_cubit.dart';
import 'package:evira/representation/blocs/login/login_cubit.dart';
import 'package:evira/representation/blocs/main_layout/main_layout_cubit.dart';
import 'package:evira/representation/blocs/register/register_cubit.dart';
import 'package:evira/representation/blocs/reset_password/reset_password_cubit.dart';
import 'package:evira/representation/screens/01_auth/00_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'config/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LoginCubit()),
            BlocProvider(create: (_) => RegisterCubit()),
            BlocProvider(create: (_) => AccountSetupCubit()),
            BlocProvider(create: (_) => ResetPasswordCubit()),
            BlocProvider(create: (_) => MainLayoutCubit()),
            BlocProvider(create: (_) => CategoriesCubit()),

          ],
          child: MaterialApp(


              theme: ThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: PrimClr,
              ),

              darkTheme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: DarkPrimClr,
              ),

              home: LoginScreen(),
          ),
        );
      },
    );
  }
}
