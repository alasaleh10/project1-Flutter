import 'package:flutter/material.dart';
import 'package:project1/core/functions/text_form_border.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/utils/app_styles.dart';

class CustomTextFromField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String hintText;
  final int? maxlines;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final IconData prefxIcon;
  final bool? isPassword;
  const CustomTextFromField(
      {super.key,
      this.onChanged,
      this.controller,
      this.obscureText = false,
      required this.hintText,
      required this.prefxIcon,
      this.isPassword,
      this.suffixIcon,
      this.validator,
      this.maxlines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextFormField(
        maxLines: maxlines,
        controller: controller,
        validator: validator,
        style: AppStyles.textStyle20bold(context),
        cursorColor: AppColors.kPrimColor,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
            labelStyle: AppStyles.textStyle20bold(context),
            errorStyle:
                AppStyles.textStyle20bold(context).copyWith(color: Colors.red),
            hintText: hintText,
            hintStyle: AppStyles.textStyle20bold(context),
            labelText: hintText,
            prefixIcon: Icon(
              prefxIcon,
              color: AppColors.kPrimColor,
            ),
            suffixIcon: isPassword == true ? suffixIcon : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            border: customTextFiledBorder(),
            errorBorder: customTextFiledBorder(isError: true),
            focusedErrorBorder: customTextFiledBorder(),
            focusedBorder: customTextFiledBorder(),
            disabledBorder: customTextFiledBorder(),
            enabledBorder: customTextFiledBorder()),
      ),
    );
  }
}
