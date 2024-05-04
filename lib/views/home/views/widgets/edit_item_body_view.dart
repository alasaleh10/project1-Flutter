import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/core/api/end_points.dart';
import 'package:project1/core/api/http_helper.dart';
import 'package:project1/core/functions/cusom_snack_bar.dart';
import 'package:project1/core/validations/validation_function.dart';
import 'package:project1/core/widgets/custom_elevated_button.dart';
import 'package:project1/model/items_model.dart';
import 'package:project1/views/auth/widgets/custom_textform.dart';


class EditItemBodyView extends StatefulWidget {
  final ItemsModel itemsModel;
  const EditItemBodyView({super.key, required this.itemsModel});

  @override
  State<EditItemBodyView> createState() => _EditItemBodyViewState();
}

class _EditItemBodyViewState extends State<EditItemBodyView> {
  bool isLoading = false;
  HttpHelper httpHelper = HttpHelper();
  final _key = GlobalKey<FormState>();
  final name = TextEditingController();
  final des = TextEditingController();
  final price = TextEditingController();
  // final name=TextEditingController();
  @override
  void initState() {
    name.text = widget.itemsModel.itemsName!;
    des.text = widget.itemsModel.itemsDes!;
    price.text = widget.itemsModel.itemsPrice!.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: ListView(
        children: [
          AspectRatio(
            aspectRatio: 2 / 1,
            child: Image.network(
                '${httpHelper.baseUrl}/storge/${widget.itemsModel.itemsImage}'),
          ),
          CustomTextFromField(
              controller: name,
              hintText: 'إسم المنتج',
              validator: (value) {
                return validations(value: value!, type: 'type');
              },
              prefxIcon: Icons.production_quantity_limits),
          CustomTextFromField(
              controller: des,
              hintText: 'وصف المنتج',
              validator: (value) {
                return validations(value: value!, type: 'type');
              },
              prefxIcon: Icons.production_quantity_limits),
          CustomTextFromField(
              controller: price,
              hintText: 'سعر المنتج',
              validator: (value) {
                return validations(value: value!, type: 'price');
              },
              prefxIcon: Icons.production_quantity_limits),
          const SizedBox(height: 15),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * .1),
                  child: CustomElevatedButton(
                      title: 'تعديل',
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          editeItem(context);
                        }
                      }),
                )
        ],
      ),
    );
  }

  void editeItem(BuildContext context) async {
    isLoading = true;
    setState(() {});
    try {
      var response =
          await httpHelper.postData(endPoint: EndPoints.upDateItem, data: {
        'id': widget.itemsModel.itemsId.toString(),
        'name': name.text,
        'description': des.text,
        'price': price.text
      });
      log(response.toString());
      isLoading = false;
      setState(() {});
      if (response['status'] == true) {
        // ignore: use_build_context_synchronously
        context.pop();
      } else {
        // displayItem(widget.itemsModel.itemsId!);

        // ignore: use_build_context_synchronously
        dispalySnackBar(context, message: 'لم يتم تغيير اي شي');
      }
    } catch (e) {
      isLoading = false;
      setState(() {});
      // ignore: use_build_context_synchronously
      dispalySnackBar(context, message: e.toString());
    }
  }
}
