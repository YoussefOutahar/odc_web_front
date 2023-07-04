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
      ? Container(
          decoration: const BoxDecoration(
            color: Color(0xFFE8F0F9),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/bg_img_2.png"),
            ),
          ),
          child: LoginForm(
            onClickSignUp: toggle,
            redirectPage: widget.redirectPage,
            routeName: widget.routeName,
          ),
        )
      : Container(
          decoration: const BoxDecoration(
            color: Color(0xFFE8F0F9),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/bg_img_2.png"),
            ),
          ),
          child: RegisterForm(
            onClickSignUp: toggle,
            redirectPage: widget.redirectPage,
            routeName: widget.routeName,
          ),
        );

  void toggle() {
    setState(() => isLogin = !isLogin);
  }
}
