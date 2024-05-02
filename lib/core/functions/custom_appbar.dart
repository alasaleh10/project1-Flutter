import 'package:flutter/material.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/utils/app_styles.dart';

AppBar customAppbar(BuildContext context, {required String title}) {
  return AppBar(
    iconTheme: const IconThemeData(color: AppColors.kPrimColor3),
    backgroundColor: AppColors.kPrimColor,
    centerTitle: false,
    title: Text(
      title,
      style: AppStyles.textStyle23bold(context)
          .copyWith(color: AppColors.kPrimColor3),
    ),
  );
}
