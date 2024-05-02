import 'package:flutter/material.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/utils/app_styles.dart';


SnackBar customSnackBar(BuildContext context, {required String errorMessage}) {
  return SnackBar(
    
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.fixed,
      padding: const EdgeInsets.symmetric(vertical: 20),
      backgroundColor: AppColors.kPrimColor,
      content: Center(
          child: FittedBox(
        child: Text(
          errorMessage,
          style: AppStyles.textStyle20bold(context).copyWith(color: AppColors.kPrimColor3),
        ),
      )));
}




dispalySnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(customSnackBar(context, errorMessage: message));
}
