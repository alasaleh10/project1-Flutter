import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/core/api/end_points.dart';
import 'package:project1/core/api/http_helper.dart';
import 'package:project1/core/functions/cusom_snack_bar.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/validations/validation_function.dart';
import 'package:project1/core/widgets/custom_elevated_button.dart';
import 'package:project1/views/auth/widgets/custom_textform.dart';
import 'package:project1/views/home/views/widgets/items.dart';

class AddITemBodyView extends StatefulWidget {
  const AddITemBodyView({super.key});

  @override
  State<AddITemBodyView> createState() => _AddITemBodyViewState();
}

class _AddITemBodyViewState extends State<AddITemBodyView> {
  HttpHelper httpHelper = HttpHelper();
  bool isLoading = false;
  File? _file;
  final _key = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _price = TextEditingController();
  final _des = TextEditingController();
  // final _name=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: ListView(
          children: [
            CustomTextFromField(
                validator: (value) {
                  return validations(value: value!, type: 'type');
                },
                controller: _name,
                hintText: 'إسم المنتج',
                prefxIcon: Icons.production_quantity_limits),
            CustomTextFromField(
                validator: (value) {
                  return validations(value: value!, type: 'type');
                },
                controller: _des,
                hintText: 'وصف المنتج',
                prefxIcon: Icons.description),
            CustomTextFromField(
                validator: (value) {
                  return validations(value: value!, type: 'type');
                },
                controller: _price,
                hintText: 'سعر المنتج',
                prefxIcon: Icons.price_change),
            IconButton(
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  final XFile? picked =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (picked == null) return;
                  _file = File(picked.path);
                },
                icon: const Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 50,
                  color: AppColors.kPrimColor,
                )),
            const SizedBox(height: 15),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * .1),
                    child: CustomElevatedButton(
                        title: 'إضافة',
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            if (_file == null) {
                              dispalySnackBar(context, message: 'اختصر الصورة');
                            } else {
                              addItem(context);
                            }
                          }
                        }),
                  )
          ],
        ));
  }

  void addItem(BuildContext context) async {
    isLoading = true;
    setState(() {});
    var response = await httpHelper.postwithFile(
        EndPoints.addItem,
        {
          'name': _name.text,
          'des': _des.text,
          'price': _price.text,
          'cat': 1.toString()
        },
        _file!);
    isLoading = false;
    setState(() {});
    if (response['status'] == true) {
      getItems();
      onTap();
// ignore: use_build_context_synchronously
      context.pop();
    } else {
// ignore: use_build_context_synchronously
      dispalySnackBar(context, message: response['message']);
    }
  }
}
