import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

import '../DataBase/Auth/auth_guard.dart';
import 'Views/Admin/dashboard.dart';
import 'Views/LoginPage/login_page.dart';

getDashboardNavigations() => [
      GetPage(
        name: "/dashboard",
        middlewares: [Middelware()],
        page: () => AuthCheck(
          routeName: '/dashboard',
          child: const Dashboard().animate().fadeIn(duration: const Duration(milliseconds: 500)),
        ),
      ),
      GetPage(
        name: "/authenticate",
        middlewares: [Middelware()],
        page: () => const Scaffold(
          body: LoginPage(
            redirectPage: Dashboard(),
            routeName: '/dashboard',
          ),
        ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
      ),
    ];

class Middelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    Get.log(page?.name ?? "");
    return super.onPageCalled(page);
  }
}
