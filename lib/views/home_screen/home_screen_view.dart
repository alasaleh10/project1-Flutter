import 'package:flutter/material.dart';
import 'package:project1/core/functions/custom_appbar.dart';
import 'package:project1/views/home/views/home_view.dart';
import 'package:project1/views/home_screen/widgets/home_screen_bottom_bar.dart';
import 'package:project1/views/profile/views/profile_view.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  List<Widget> pages = const [HomeView(), Text('data'), ProfileView()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: ''),
      bottomNavigationBar: HomeScreenBottomBar(
        index: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: pages.elementAt(index),
    );
  }
}
