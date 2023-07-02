import 'package:flutter/material.dart';

import '../Core/Components/login_form.dart';
import '../Core/Components/register_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {super.key, required this.redirectPage, required this.routeName});

  final Widget redirectPage;
  final String routeName;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginForm(
          onClickSignUp: toggle,
          redirectPage: widget.redirectPage,
          routeName: widget.routeName,
        )
      : RegisterForm(
          onClickSignUp: toggle,
          redirectPage: widget.redirectPage,
          routeName: widget.routeName,
        );

  void toggle() {
    setState(() => isLogin = !isLogin);
  }
}
