import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Services/Utils/delayed_widget.dart';
import '../Components/deafult_button.dart';
import 'Components/tab_tile.dart';
import 'footer.dart';
import 'header.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key, required this.page});
  final Widget page;

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SliderMenu(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              floating: true,
              flexibleSpace: Header(
                openDrawer: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
            if (!(Get.currentRoute.startsWith("/member/") ||
                Get.currentRoute.startsWith("/formation/") ||
                Get.currentRoute.startsWith("/blogPost/") ||
                Get.currentRoute.startsWith("/contactUs")))
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: const Offset(0, -kToolbarHeight),
                  child: Stack(
                    children: [
                      Container(
                        width: size.width,
                        height: size.height * 0.7,
                        color: Theme.of(context).primaryColor.withOpacity(1),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DelayedWidget(
                              delayDuration: Duration(milliseconds: 500),
                              from: DelayFrom.bottom,
                              child: Text(
                                "Optima Decision Consulting",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            DelayedWidget(
                              delayDuration: Duration(milliseconds: 800),
                              from: DelayFrom.bottom,
                              child: Text(
                                "Smart future is yours",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (Get.currentRoute != "/aboutUs")
                        Positioned(
                          bottom: 0,
                          right: 0,
                          // Learn more Text
                          child: DelayedWidget(
                            delayDuration: const Duration(milliseconds: 1500),
                            from: DelayFrom.bottom,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () => Get.toNamed("/aboutUs"),
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Learn more",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            SliverToBoxAdapter(
              child: widget.page,
            ),
            const SliverToBoxAdapter(
              child: Footer(),
            ),
          ],
        ));
  }
}

class SliderMenu extends StatelessWidget {
  const SliderMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      color: Colors.grey[200],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/images/logo.png',
              height: 50.0,
            ),
          ),
          const SizedBox(height: 40.0),
          TabTile(text: "Home", onTap: () => Get.offAndToNamed("/home")),
          TabTile(text: "About", onTap: () => Get.toNamed("/aboutUs")),
          TabTile(text: "Formations", onTap: () => Get.toNamed("/formations")),
          TabTile(text: "Blog", onTap: () => Get.toNamed("/blog")),
          TabTile(text: "Contact Us", onTap: () => Get.toNamed("/contactUs")),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
