import 'package:flutter/material.dart';
import 'package:project1/core/functions/custom_appbar.dart';
import 'package:project1/views/home/views/widgets/add_item_body_view.dart';

class AddItemView extends StatelessWidget {
 
  const AddItemView({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: "إضافة مننج"),
      body:  const AddITemBodyView(),
    );
  }
}
