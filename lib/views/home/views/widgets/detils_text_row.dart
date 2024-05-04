import 'package:flutter/material.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/utils/app_styles.dart';

class DetilsTextRow extends StatelessWidget {
  const DetilsTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  children: [
                    Container(
                      width: 15,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: AppColors.kPrimColor,
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(8),
                              bottomStart: Radius.circular(8))),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'التفاصــيل',
                      style: AppStyles.textStyle23bold(context),
                    )
                  ],
                );
  }
}