import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/main_layout/main_layout_cubit.dart';
import '../../widgets/nav_bar.dart';
import '01_home_screen.dart';
import '02_categories_screen.dart';
import '03_my_cart_screen.dart';
import '04_settings_screen.dart';

class MainLayout extends StatelessWidget {
  MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List Screens = [
      HomeScreen(),
      CategoriesScreen(),
      MyCartScreenScreen(),
      SettingsScreen(),
    ];
    return SafeArea(
        child: Scaffold(
          body: BlocConsumer<MainLayoutCubit, MainLayoutState>(
              listener: (context,state){
              },

              builder: (context,state){
                return Screens[context.read<MainLayoutCubit>().currentIndex];
              },
          ),

          bottomNavigationBar: BlocConsumer<MainLayoutCubit, MainLayoutState>(
            listener: (context, state) {
              print(context.read<MainLayoutCubit>().currentIndex);
            },
            builder: (context, state) {
              return NavBar(
                selectedIndex: context.read<MainLayoutCubit>().currentIndex,
                onChanged: (index) {
                  context.read<MainLayoutCubit>().changePage(index);

                },
              );
            },
          ),
        ));
  }
}
