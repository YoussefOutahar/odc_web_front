import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'Layout/app_layout.dart';
import 'Views/AboutUsPage/about_us_page.dart';
import 'Views/BlogPage/blog_page.dart';
import 'Views/FormationsInfoPages/formation_doctorant.dart';
import 'Views/FormationsInfoPages/formation_learning_travel.dart';
import 'Views/FormationsInfoPages/formation_soft_skills.dart';
import 'Views/FormationsInfoPages/formation_sur_mesure.dart';
import 'Views/InfoPages/blog_post_page.dart';
import 'Views/ContactUsPage/contact_us_page.dart';
import 'Views/InfoPages/event_info_page.dart';
import 'Views/FormationsPage/formations_page.dart';
import 'Views/HomePage/main_web_front.dart';
import 'Views/InfoPages/team_member_page.dart';

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
          showHeader: false,
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
      ...infoPages,
      ...formationsInfoPages,
    ];

List<GetPage> infoPages = [
  GetPage(
    name: "/member/:id",
    transition: Transition.fadeIn,
    middlewares: [Middelware()],
    page: () => const AppLayout(
      showHeader: false,
      page: TeamMemberPage(),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 500),
        ),
  ),
  GetPage(
    name: "/event/:id",
    transition: Transition.fadeIn,
    middlewares: [Middelware()],
    page: () => const AppLayout(
      showHeader: false,
      page: EventInfoPage(),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 500),
        ),
  ),
  GetPage(
    name: "/blogPost/:id",
    transition: Transition.fadeIn,
    middlewares: [Middelware()],
    page: () => const AppLayout(
      showHeader: false,
      page: BlogPostPage(),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 500),
        ),
  ),
  // GetPage(
  //   name: "/formations/:id",
  //   transition: Transition.fadeIn,
  //   middlewares: [Middelware()],
  //   page: () => const AppLayout(
  //     showHeader: false,
  //     page: FormationInfoPage(),
  //   ).animate().fadeIn(
  //         duration: const Duration(milliseconds: 500),
  //       ),
  // ),
];

List<GetPage> formationsInfoPages = [
  GetPage(
    name: '/formations/surMesures',
    transition: Transition.fadeIn,
    middlewares: [Middelware()],
    page: () => const AppLayout(
      showHeader: false,
      page: FormationSurMesuresInfoPage(),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 500),
        ),
  ),
  GetPage(
    name: '/formations/softSkills',
    transition: Transition.fadeIn,
    middlewares: [Middelware()],
    page: () => const AppLayout(
      showHeader: false,
      page: FormationSoftSkillsInfoPage(),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 500),
        ),
  ),
  GetPage(
    name: '/formations/doctorant',
    transition: Transition.fadeIn,
    middlewares: [Middelware()],
    page: () => const AppLayout(
      showHeader: false,
      page: FormationDoctorantInfoPage(),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 500),
        ),
  ),
  GetPage(
    name: '/formations/learningTravel',
    transition: Transition.fadeIn,
    middlewares: [Middelware()],
    page: () => const AppLayout(
      showHeader: false,
      page: FormationLearningTravelInfoPage(),
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
