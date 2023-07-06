import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

import 'Views/DashboardView/dashboard.dart';

getDashboardNavigations() => [
      GetPage(
        name: "/dashboard",
        middlewares: [Middelware()],
        page: () => const Dashboard(),
      ),
    ];

class Middelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    Get.log(page?.name ?? "");
    return super.onPageCalled(page);
  }
}
