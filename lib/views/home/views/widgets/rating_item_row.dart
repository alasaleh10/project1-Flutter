import 'package:flutter/material.dart';
import 'package:project1/core/utils/app_styles.dart';

class RatingItemRow extends StatelessWidget {
  const RatingItemRow({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Row(
            children: List.generate(
                5,
                (index) => const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )),
          ),
          const VerticalDivider(
            thickness: 2,
            width: 20,
          ),
          Text(
            'تم شراءه 30 مرة',
            style: AppStyles.textStyle20bold(context),
          )
        ],
      ),
    );
  }
}
