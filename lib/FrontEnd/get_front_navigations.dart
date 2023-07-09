import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'Layout/app_layout.dart';
import 'Views/AboutUsPage/about_us_page.dart';
import 'Views/BlogPage/blog_page.dart';
import 'Views/ContactUsPage/contact_us_page.dart';
import 'Views/FormationsPage/formations_page.dart';
import 'Views/HomePage/main_web_front.dart';

getFrontNavigations() => [
      GetPage(
        name: "/home",
        middlewares: [Middelware()],
        page: () => AppLayout(
          page: const HomePage().animate().fadeIn(
                duration: const Duration(milliseconds: 500),
              ),
        ),
      ),
      GetPage(
        name: "/aboutUs",
        middlewares: [Middelware()],
        page: () => const AppLayout(
          page: AboutUsPage(),
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
        name: "/formations",
        page: () => const AppLayout(
          page: FormationsPage(),
        ),
        children: const [],
      ),
      GetPage(
        name: "/blog",
        middlewares: [Middelware()],
        page: () => const AppLayout(page: BlogPage()),
      ),
      GetPage(
        name: "/member/:id",
        middlewares: [Middelware()],
        page: () => const AppLayout(
          page: FormationsPage(),
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
