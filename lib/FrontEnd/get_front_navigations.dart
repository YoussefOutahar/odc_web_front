import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'Layout/app_layout.dart';
import 'Views/AboutUsPage/about_us_page.dart';
import 'Views/BlogPage/blog_page.dart';
import 'Views/BlogPage/blog_post_page.dart';
import 'Views/ContactUsPage/contact_us_page.dart';
import 'Views/FormationsPage/formation_info.dart';
import 'Views/FormationsPage/formations_page.dart';
import 'Views/HomePage/main_web_front.dart';
import 'Views/team_member_page.dart';

getFrontNavigations() => [
      GetPage(
        name: "/home",
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(
          page: HomePage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
      ),
      GetPage(
        name: "/aboutUs",
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(
          page: AboutUsPage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
      ),
      GetPage(
        name: "/contactUs",
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(
          page: ContactUsPage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
      ),
      GetPage(
        name: "/formations",
        transition: Transition.fadeIn,
        page: () => const AppLayout(
          page: FormationsPage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
        children: const [],
      ),
      GetPage(
        name: "/blog",
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(page: BlogPage()).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
      ),
      GetPage(
        name: "/member/:id",
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(
          page: TeamMemberPage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
      ),
      GetPage(
        name: "/blogPost/:id",
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(
          page: BlogPostPage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
      ),
      GetPage(
        name: "/formations/:id",
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(
          page: FormationInfoPage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
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
