import 'package:flutter/material.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width, height;

  final bool isDetils;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isDetils = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: AppColors.kPrimColor,
            minimumSize: Size(
                isDetils ? width ?? 0 : MediaQuery.sizeOf(context).width * .7,
                height ?? 50)),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyles.textStyle23bold(context)
              .copyWith(color: AppColors.kPrimColor3),
        ));
  }
}
