import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:odc_web_front/Views/FormationsPage/formations_page.dart';
import 'DataBase/auth_guard.dart';
import 'Core/Layout/app_layout.dart';
import 'Views/ContactUsPage/contact_us_page.dart';
import 'Views/login_page.dart';
import 'Views/HomePage/main_web_front.dart';

getNavigations() => [
      GetPage(
        name: "/home",
        middlewares: [Middelware()],
        page: () => AppLayout(
          page: const HomePage()
              .animate()
              .fadeIn(duration: const Duration(milliseconds: 500)),
        ),
      ),
      GetPage(
        name: "/contactUs",
        middlewares: [Middelware()],
        page: () => const AppLayout(
          page: ContactUsPage(),
        ),
      ),
      GetPage(
        name: "/authenticate",
        middlewares: [Middelware()],
        page: () => const Scaffold(
          body: LoginPage(
            redirectPage: Center(
              child: Text("Home"),
            ),
            routeName: '/home',
          ),
        ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
      ),
      GetPage(
        name: "/formations",
        page: () => const AppLayout(
          page: FormationsPage(),
        ),
      ),
      GetPage(
        name: "/testAuthGuard",
        middlewares: [Middelware()],
        page: () => const AuthCheck(
          routeName: '/testAuthGuard',
          child: Center(
            child: Text("Test Auth Guard"),
          ),
        ),
      ),
    ];

class Middelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    Get.log(page?.name ?? "");
    return super.onPageCalled(page);
  }
}
