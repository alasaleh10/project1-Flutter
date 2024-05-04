import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/core/cached_helper.dart';
import 'package:project1/core/routers/app_routers.dart';
import 'package:project1/core/widgets/custom_elevated_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomElevatedButton(
        title: 'تسجيل الخروج',
        onPressed: () {
          CacheHelper.sharedPreferences.clear();
          GoRouter.of(context).replaceNamed(AppRouters.loginView);
        },
      ),
    );
  }
}
