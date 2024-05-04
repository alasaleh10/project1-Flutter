import 'package:flutter/material.dart';
import 'package:project1/core/functions/custom_appbar.dart';
import 'package:project1/model/items_model.dart';
import 'package:project1/views/home/views/widgets/edit_item_body_view.dart';

class EditItem extends StatelessWidget {
  final ItemsModel itemsModel;
  const EditItem({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: itemsModel.itemsName!),
      body: EditItemBodyView(
        itemsModel: itemsModel,
      ),
    );
  }
}
