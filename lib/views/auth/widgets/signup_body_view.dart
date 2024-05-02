import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/core/api/end_points.dart';
import 'package:project1/core/api/http_helper.dart';
import 'package:project1/core/cached_helper.dart';
import 'package:project1/core/functions/cusom_snack_bar.dart';
import 'package:project1/core/routers/app_routers.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/utils/app_styles.dart';
import 'package:project1/core/validations/validation_function.dart';
import 'package:project1/core/widgets/custom_elevated_button.dart';
import 'package:project1/views/auth/widgets/custom_textform.dart';

class SignUpBodyView extends StatefulWidget {
  const SignUpBodyView({super.key});

  @override
  State<SignUpBodyView> createState() => _SignUpBodyViewState();
}

class _SignUpBodyViewState extends State<SignUpBodyView> {
  HttpHelper helper = HttpHelper();

  final _key = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool isLoading = false;
  bool showpass = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _key,
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * .2),
              Text(
                'تسـجيل ',
                style: AppStyles.textStyle25bold(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomTextFromField(
                  validator: (value) {
                    return validations(value: value!, type: 'email');
                  },
                  controller: _email,
                  hintText: 'البريد الإلكتروني',
                  prefxIcon: Icons.email_outlined),
              CustomTextFromField(
                  maxlines: 1,
                  isPassword: true,
                  obscureText: showpass,
                  suffixIcon: IconButton(
                    onPressed: () {
                      showpass = !showpass;
                      setState(() {});
                    },
                    icon: Icon(
                      showpass ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.kPrimColor,
                    ),
                  ),
                  validator: (value) {
                    return validations(value: value!, type: 'password');
                  },
                  controller: _password,
                  hintText: 'كلمة المرور',
                  prefxIcon: FontAwesomeIcons.lock),
              const SizedBox(height: 20),
              isLoading
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * .1),
                      child: CustomElevatedButton(
                          title: 'تسجيل الدخول',
                          onPressed: () {
                            _signUp(context);
                          })),
              const SizedBox(height: 20),
              DefaultTextStyle(
                  style: AppStyles.textStyle23bold(context),
                  child: Row(
                    children: [
                      const Text('لديك حساب؟'),
                      const SizedBox(width: 20),
                      GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: const Text(' تسجيل الدخول'))
                    ],
                  ))
            ],
          ),
        ));
  }

  void _signUp(BuildContext context) async {
    
    isLoading = true;
    setState(() {});
    var response = await helper.postData(
        endPoint: EndPoints.signup,
        data: {'email': _email.text, 'password': _password.text});
    isLoading = false;

    if (response['status'] == true) {
      CacheHelper.saveData(key: 'id', value: response['data']['user_id']);
        // ignore: use_build_context_synchronously
        GoRouter.of(context).pushReplacementNamed(AppRouters.homeView);

      
    } else {
      // ignore: use_build_context_synchronously
      dispalySnackBar(context, message: response['message']);
    }
    setState(() {});
  }
}
