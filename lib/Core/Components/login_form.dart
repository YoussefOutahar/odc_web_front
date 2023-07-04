import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../DataBase/auth.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(
      {Key? key,
      required this.onClickSignUp,
      required this.redirectPage,
      required this.routeName})
      : super(key: key);

  final VoidCallback onClickSignUp;
  final Widget redirectPage;
  final String routeName;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Image.asset("assets/images/logo.png"),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ElevatedButton(
          onPressed: signIn,
          child: const Text('Login'),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        RichText(
          text: TextSpan(
            text: 'Don\'t have an account? ',
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: 'Sign up',
                style: const TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    widget.onClickSignUp();
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future signIn() async {
    try {
      await AuthController.signInUsingEmail(
          _emailController.text, _passwordController.text);
      Get.off(() => widget.redirectPage, routeName: widget.routeName);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
