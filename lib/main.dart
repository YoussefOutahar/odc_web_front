import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

import 'Services/analytics_service.dart';
import 'Services/Themes/app_theme.dart';
import 'DataBase/firebase_options.dart';
import 'Views/error_page.dart';
import 'get_navigations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  runApp(const MyApp());
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
      getPages: getNavigations(),
      navigatorObservers: [
        AnalyticsService().getAnalyticsObserver(),
      ],
      initialRoute: '/home',
      unknownRoute: GetPage(name: '/404', page: () => const ErrorPage()),
    ).animate().fadeIn(duration: const Duration(milliseconds: 500));
  }
}
