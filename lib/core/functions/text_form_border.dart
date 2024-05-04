import 'package:flutter/material.dart';
import 'package:project1/core/utils/app_colors.dart';

OutlineInputBorder customTextFiledBorder({bool isError = false}) {
  return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide:
          BorderSide(color: isError ? Colors.red : AppColors.kPrimColor));
}
