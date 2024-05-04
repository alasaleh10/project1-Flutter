import 'package:flutter/material.dart';
import 'package:project1/core/functions/custom_appbar.dart';
import 'package:project1/views/home/views/widgets/detils_body_view.dart';

class ItemsDetils extends StatelessWidget {
  final List data;
  const ItemsDetils({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: data[0]),
      body: DetilsBodyView(id: data[1]),
    );
  }
}
