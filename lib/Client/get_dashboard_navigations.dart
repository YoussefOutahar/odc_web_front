import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

import 'Views/Admin/dashboard.dart';
import 'Views/login_page.dart';

getDashboardNavigations() => [
      GetPage(
        name: "/dashboard",
        middlewares: [Middelware()],
        page: () => const Dashboard(),
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
