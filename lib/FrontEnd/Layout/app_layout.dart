import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            SliverToBoxAdapter(
              child: Transform.translate(
                offset: const Offset(0, -kToolbarHeight),
                child: Container(
                  width: size.width,
                  height: size.height * 0.7,
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Optima Decision Consulting",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Smart future is yours",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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
