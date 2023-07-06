import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Components/login_form.dart';
import '../Components/register_form.dart';

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
  Widget build(BuildContext context) {
    return isLogin
        ? Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE8F0F9),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/OpenSourceImages/img1.png"),
              ),
            ),
            child: Center(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    margin: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5),
                    ),
                    child: Center(
                      child: LoginForm(
                        onClickSignUp: toggle,
                        redirectPage: widget.redirectPage,
                        routeName: widget.routeName,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ).animate().fadeIn(duration: const Duration(milliseconds: 500))
        : Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE8F0F9),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/OpenSourceImages/img1.png"),
              ),
            ),
            child: Center(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    margin: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5),
                    ),
                    child: Center(
                      child: RegisterForm(
                        onClickSignUp: toggle,
                        redirectPage: widget.redirectPage,
                        routeName: widget.routeName,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ).animate().fadeIn(duration: const Duration(milliseconds: 500));
  }

  void toggle() {
    setState(() => isLogin = !isLogin);
  }
}
