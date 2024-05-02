import 'package:flutter/material.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: AppColors.kPrimColor,
            minimumSize: Size(MediaQuery.sizeOf(context).width * .7, 50)),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyles.textStyle23bold(context)
              .copyWith(color: AppColors.kPrimColor3),
        ));
  }
}
