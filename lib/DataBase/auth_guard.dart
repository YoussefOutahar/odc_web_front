import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:odc_web_front/Views/login_page.dart';

import '../Views/error_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key, required this.child, required this.routeName})
      : super(key: key);

  final Widget child;
  final String routeName;

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: FirebaseAuth.instance.currentUser,
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return widget.child;
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingAnimationWidget.threeArchedCircle(
              color: Colors.black, size: 35);
        } else if (snapshot.hasError) {
          return const ErrorPage();
        } else {
          return LoginPage(
            redirectPage: widget.child,
            routeName: widget.routeName,
          );
        }
      },
    );
  }
}
