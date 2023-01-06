import 'package:evira/config/app_theme.dart';
import 'package:evira/representation/blocs/main_layout/main_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sizer/sizer.dart';

class NavBar extends StatelessWidget {
  int selectedIndex;
  ValueChanged<int>? onChanged;
  NavBar({
    Key? key,
    this.onChanged,
    required this.selectedIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 15),
      child: GNav(
          haptic: false,
          tabBorderRadius: 30,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          gap: 8,
          color: Colors.grey,
          activeColor: AppTheme.activeClr(context),
          iconSize: 7.w, // tab button icon size
          tabBackgroundColor: AppTheme.secClr(context), // selected tab background color
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6), // navigation bar padding
          onTabChange: onChanged,
          selectedIndex: selectedIndex,
          tabs: const [
            GButton(
              icon: Icons.home_filled,
              text: 'Home',
            ),
            GButton(
              icon: Icons.explore_outlined,
              text: 'Explore',
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.person_outline_rounded,
              text: 'Profile',
            ),
          ]
      ),
    );
  }
}
