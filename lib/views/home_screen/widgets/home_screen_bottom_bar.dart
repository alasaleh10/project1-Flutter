import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/utils/app_styles.dart';

class HomeScreenBottomBar extends StatefulWidget {
  final void Function(int) onTap;
  final int index;
  const HomeScreenBottomBar(
      {super.key, required this.onTap, required this.index});

  @override
  State<HomeScreenBottomBar> createState() => _HomeScreenBottomBarState();
}

class _HomeScreenBottomBarState extends State<HomeScreenBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.index,
        mouseCursor: MouseCursor.uncontrolled,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        enableFeedback: true,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedLabelStyle:
            AppStyles.textStyle20bold(context).copyWith(color: Colors.black),
        selectedLabelStyle: AppStyles.textStyle20bold(context)
            .copyWith(color: AppColors.kPrimColor3),
        selectedItemColor: AppColors.kPrimColor3,
        // iconSize: 25,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.kPrimColor,
        onTap: widget.onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الرئيسية'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cartShopping), label: 'الســلة'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user), label: 'المــلف الشخصي'),
        ]);
  }
}
