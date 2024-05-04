import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/core/routers/app_routers.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/views/home/views/widgets/home_body_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.kPrimColor,
          onPressed: () {
            GoRouter.of(context).pushNamed(AppRouters.addItemView);
          },
          child: const Icon(
            Icons.add,
            color: AppColors.kPrimColor3,
          ),
        ),
        body: const HomeBodyView());
  }
}
