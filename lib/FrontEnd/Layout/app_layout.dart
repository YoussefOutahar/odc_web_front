import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/scroll_up_indicator.dart';
import 'Components/app_header.dart';
import 'Components/header_type.dart';
import 'Components/learn_more_button.dart';
import 'Components/slider_menu.dart';
import 'footer.dart';
import 'header.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key, required this.page, required this.type});
  final Widget page;
  final HeaderType type;

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
                showLogo: widget.type != HeaderType.compactHeader,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -kToolbarHeight * 1.2),
                    child: Stack(
                      children: [
                        AppHeader(type: widget.type),
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
                  const SizedBox(height: 20.0),
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
