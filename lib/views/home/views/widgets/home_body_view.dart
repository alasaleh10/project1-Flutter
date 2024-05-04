import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:project1/core/utils/app_images.dart';

import 'package:project1/views/auth/widgets/custom_textform.dart';
import 'package:project1/views/home/views/widgets/categorisess.dart';
import 'package:project1/views/home/views/widgets/items.dart';
import 'package:project1/views/home/views/widgets/text_defualt_row.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomTextFromField(
            hintText: 'عن ماذا تبحث؟', prefxIcon: FontAwesomeIcons.searchengin),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Image.asset(Assets.imagesBannar),
          ),
        ),
        TextDefualtRow(
          title: 'الأقسام',
          subTitle: 'الكل',
          onTaap: () {},
        ),
        const SizedBox(height: 10),
        const Categorisess(),
        const SizedBox(height: 10),
        TextDefualtRow(
          title: 'العـروض',
          subTitle: 'الكل',
          onTaap: () {},
        ),
        const SizedBox(height: 10),
        const Items(),
        const SizedBox(height: 10),
      ],
    );
  }
}
