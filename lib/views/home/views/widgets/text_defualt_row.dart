import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/utils/app_styles.dart';

class TextDefualtRow extends StatelessWidget {
  final String title, subTitle;
  final VoidCallback onTaap;
  const TextDefualtRow(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onTaap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DefaultTextStyle(
        style: AppStyles.textStyle23bold(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            GestureDetector(onTap: onTaap, child: Text(subTitle))
          ],
        ),
      ),
    );
  }
}
