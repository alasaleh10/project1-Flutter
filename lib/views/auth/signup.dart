import 'package:flutter/material.dart';
import 'package:project1/core/functions/custom_appbar.dart';
import 'package:project1/views/auth/widgets/signup_body_view.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: 'تــسجيل'),

      body: const SignUpBodyView(),
    );
  }
}
