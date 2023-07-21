import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Animations/delayed_widget.dart';
import '../Components/scroll_up_indicator.dart';
import 'Components/app_header.dart';
import 'Components/slider_menu.dart';
import 'footer.dart';
import 'header.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key, required this.page, this.showHeader = true});
  final Widget page;
  final bool showHeader;

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SliderMenu(),
      floatingActionButton: ScrollUpIndicator(_scrollController),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              collapsedHeight: kToolbarHeight * 1.2,
              floating: true,
              flexibleSpace: Header(
                openDrawer: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  if (widget.showHeader)
                    Transform.translate(
                      offset: const Offset(0, -kToolbarHeight * 1.2),
                      child: Stack(
                        children: [
                          const AppHeader(),
                          if (Get.currentRoute != "/aboutUs")
                            const Positioned(
                              bottom: 0,
                              right: 0,
                              // Learn more Text
                              child: LearnMoreButton(),
                            ),
                        ],
                      ),
                    ),
                  widget.page,
                  const Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
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
    );
  }
}
