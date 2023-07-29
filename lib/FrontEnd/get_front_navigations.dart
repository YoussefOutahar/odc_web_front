import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'Layout/Components/header_type.dart';
import 'Layout/app_layout.dart';
import 'Views/AboutUsPage/about_us_page.dart';
import 'Views/BlogPage/blog_page.dart';
import 'Views/ConseilsPage/conseils_page.dart';
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
        transitionDuration: const Duration(milliseconds: 700),
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(
          type: HeaderType.header,
          page: HomePage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
      ),
      GetPage(
        name: "/aboutUs",
        transitionDuration: const Duration(milliseconds: 700),
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(
          type: HeaderType.compactHeader,
          page: AboutUsPage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
      ),
      GetPage(
        name: "/contactUs",
        transitionDuration: const Duration(milliseconds: 700),
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(
          type: HeaderType.compactHeader,
          page: ContactUsPage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
      ),
      GetPage(
        name: "/formations",
        transitionDuration: const Duration(milliseconds: 700),
        transition: Transition.fadeIn,
        page: () => const AppLayout(
          type: HeaderType.compactHeader,
          page: FormationsPage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
        children: const [],
      ),
      GetPage(
        name: "/conseils",
        transitionDuration: const Duration(milliseconds: 700),
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(
          type: HeaderType.compactHeader,
          page: ConseilsPage(),
        ).animate().fadeIn(
              duration: const Duration(milliseconds: 500),
            ),
      ),
      GetPage(
        name: "/blog",
        transitionDuration: const Duration(milliseconds: 700),
        transition: Transition.fadeIn,
        middlewares: [Middelware()],
        page: () => const AppLayout(
          type: HeaderType.compactHeader,
          page: BlogPage(),
        ).animate().fadeIn(
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
      type: HeaderType.hideHeader,
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
      type: HeaderType.hideHeader,
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
      type: HeaderType.hideHeader,
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
      type: HeaderType.hideHeader,
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
      type: HeaderType.hideHeader,
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
      type: HeaderType.hideHeader,
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
      type: HeaderType.hideHeader,
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
