import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../DataBase/Auth/auth.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key, required this.onClickSignUp, required this.redirectPage, required this.routeName})
      : super(key: key);

  final VoidCallback onClickSignUp;
  final Widget redirectPage;
  final String routeName;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
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
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(left: size.width / 16, right: size.width / 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && !EmailValidator.validate(value)) {
                  return 'Enter a valid email';
                }
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty && value.length < 6) {
                  return 'Please enter min. 6 characters';
                }
                return null;
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ElevatedButton(
              onPressed: signUp,
              child: const Text('Sign Up'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            RichText(
              text: TextSpan(
                text: 'Already have an account?',
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: ' Login',
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
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await AuthController.signUpUsingEmail(_emailController.text, _passwordController.text);
      Get.off(widget.redirectPage, routeName: widget.routeName);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
