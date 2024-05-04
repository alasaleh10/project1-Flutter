import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/core/api/end_points.dart';
import 'package:project1/core/api/http_helper.dart';
import 'package:project1/core/functions/cusom_snack_bar.dart';

import 'package:project1/core/utils/app_styles.dart';
import 'package:project1/core/widgets/custom_elevated_button.dart';
import 'package:project1/model/items_model.dart';
import 'package:project1/views/home/views/widgets/items.dart';

class DeleteItem extends StatefulWidget {
  final ItemsModel itemsModel;
  const DeleteItem({super.key, required this.itemsModel});

  @override
  State<DeleteItem> createState() => _DeleteItemState();
}

class _DeleteItemState extends State<DeleteItem> {
  HttpHelper httpHelper = HttpHelper();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Column(
        children: [
          Text(
            'هل تود حذف ${widget.itemsModel.itemsName}',
            style: AppStyles.textStyle23bold(context),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 15),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  children: [
                    Expanded(
                        child: CustomElevatedButton(
                      title: 'إلغاء',
                      onPressed: () {
                        context.pop();
                      },
                    )),
                    const SizedBox(width: 15),
                    Expanded(
                        child: CustomElevatedButton(
                      title: 'نعم',
                      onPressed: () {
                        deleteItem(context);
                      },
                    ))
                  ],
                )
        ],
      ),
    );
  }

  void deleteItem(BuildContext context) async {
    isLoading = true;
    try {
      setState(() {});
      var response =
          await httpHelper.postData(endPoint: EndPoints.deleteItem, data: {
        'itemId': widget.itemsModel.itemsId.toString(),
        'image': widget.itemsModel.itemsImage
      });
      isLoading = false;
      setState(() {});
      if (response['status'] == true) {
        getItems();
        onTap();
       
        // ignore:     use_build_context_synchronously
        context.pop();

        // ignore: use_build_context_synchronously
        context.pop();
      } else {
        // ignore: use_build_context_synchronously
        dispalySnackBar(context, message: response['message']);
      }
    } catch (e) {
      log(e.toString());
      isLoading = false;
      setState(() {});
    }
  }
}
