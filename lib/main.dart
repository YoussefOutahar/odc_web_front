import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import 'Client/get_dashboard_navigations.dart';
import 'Services/analytics_service.dart';
import 'Services/Themes/app_theme.dart';
import 'DataBase/firebase_options.dart';
import 'FrontEnd/Views/error_page.dart';
import 'FrontEnd/get_front_navigations.dart';
import 'translations/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  // setPathUrlStrategy();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
      ],
      fallbackLocale: const Locale('fr'),
      assetLoader: const CodegenLoader(),
      path: "assets/translations",
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Optima Decision',
      theme: AppThemes.deafult,
      darkTheme: AppThemes.alternative,
      themeMode: AppThemes().themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      getPages: [
        ...getFrontNavigations(),
        ...getDashboardNavigations(),
      ],
      navigatorObservers: [
        AnalyticsService().getAnalyticsObserver(),
      ],
      initialRoute: '/home',
      unknownRoute: GetPage(name: '/404', page: () => const ErrorPage()),
    ).animate().fadeIn(duration: const Duration(milliseconds: 500));
  }
}
