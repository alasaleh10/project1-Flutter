import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/utils/app_styles.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({super.key});

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int selectindex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
        currentIndex: selectindex,
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
        onTap: (index) {
          setState(() {
            selectindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              label: 'المــلف الشخصي'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cartShopping), label: 'الســلة'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الرئيسية'),
        ]);
  }
}
