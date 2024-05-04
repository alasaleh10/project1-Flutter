import 'package:flutter/material.dart';
import 'package:project1/views/auth/widgets/login_body_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LoginBodyView()),
    );
  }
}
