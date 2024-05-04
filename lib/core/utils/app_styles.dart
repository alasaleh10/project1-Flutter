import 'package:flutter/material.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/utils/responsive_text.dart';

abstract class AppStyles {
  static TextStyle textStyle25Regular(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 25),
        color: const Color(0xFF1B75BB),
        fontFamily: 'ElMessiri',
        fontWeight: FontWeight.w400);
  }

  static TextStyle textStyle20Regular(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        color: AppColors.kPrimColor,
        fontFamily: 'ElMessiri',
        fontWeight: FontWeight.w400);
  }

  static TextStyle textStyle20bold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        color: AppColors.kPrimColor,
        fontFamily: 'ElMessiri',
        fontWeight: FontWeight.bold);
  }

  static TextStyle textStyle23bold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 23),
        color: AppColors.kPrimColor,
        fontFamily: 'ElMessiri',
        fontWeight: FontWeight.w800);
  }

  static TextStyle textStyle25bold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 23),
        color: AppColors.kPrimColor,
        fontFamily: 'ElMessiri',
        fontWeight: FontWeight.w800);
  }

  static TextStyle textStyle18SemiBold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        color: AppColors.kPrimColor,
        fontFamily: 'ElMessiri',
        fontWeight: FontWeight.w600);
  }

  static TextStyle textStyle15SemiBold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 15),
        color: AppColors.kPrimColor,
        fontFamily: 'ElMessiri',
        fontWeight: FontWeight.bold);
  }

  // static TextStyle textStyle19Rqgular(BuildContext context) {
  //   return TextStyle(
  //       fontSize: getResponsiveFontSize(context, fontSize: 20),
  //       color: AppColors.kPrimColor,
  //       fontFamily: '',
  //       fontWeight: FontWeight.w400);
  // }
}
