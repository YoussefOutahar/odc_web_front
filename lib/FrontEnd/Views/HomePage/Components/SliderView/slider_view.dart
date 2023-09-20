import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:odc/Services/constants.dart';

import '../../../../../DataBase/Models/events.dart';
import '../../../../../Services/Utils/responsive.dart';
import '../../../../../Services/Utils/utils.dart';
import '../../../../Animations/animated_opacity_when_hovered.dart';
import '../event_card.dart';
import 'Widgets/information_layout.dart';
import 'Widgets/timer_bar.dart';

class SliderView extends StatefulWidget {
  const SliderView({Key? key, required this.data}) : super(key: key);

  final List<Event> data;

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin<SliderView> {
  PageController pageController = PageController(keepPage: true);
  CarouselController scrollController = CarouselController();

  /// Default Progress Index
  int currentIndex = 0;
  List<double> progress = [];

  /// Timers
  // Timer? timer;

  /// Default Positions Value
  final double positionTop = 10;
  final double positionLeft = 10;
  final double positionRight = 10;
  final double positionBottom = 10;

  // @override
  // void initState() {
  //   super.initState();
  //   // _initSlider();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   timer!.cancel();
  // }

  // _initSlider() {
  //   progress.clear();
  //   for (var _ in widget.data) {
  //     progress.add(0.0);
  //   }
  //   if (progress.isNotEmpty) {
  //     _watchingProgress();
  //   }
  // }

  // _watchingProgress() {
  //   Timer.periodic(const Duration(milliseconds: 50), (timer) {
  //     setState(() {
  //       if (progress[currentIndex] + 0.01 < 1) {
  //         progress[currentIndex] += 0.01;
  //       } else {
  //         progress[currentIndex] = 1;
  //         timer.cancel();
  //         if (Responsive.isDesktop(context)) {
  //           pageController.animateToPage(currentIndex + 1,
  //               duration: const Duration(milliseconds: 200), curve: Curves.decelerate);
  //         }
  //         if (currentIndex < widget.data.length - 1) {
  //           currentIndex++;
  //           _watchingProgress();
  //         } else {
  //           progress.clear();
  //           currentIndex = 0;
  //           if (Responsive.isDesktop(context)) {
  //             pageController.animateToPage(0, duration: const Duration(milliseconds: 200), curve: Curves.decelerate);
  //           }
  //           _initSlider();
  //         }
  //       }
  //     });
  //   });
  // }

  void previousSlide() {
    // if (currentIndex > 0) {
    //   progress[currentIndex - 1] = 0;
    //   progress[currentIndex] = 0;
    //   currentIndex--;
    //   pageController.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.decelerate);
    // }
    scrollController.previousPage();
  }

  void nextSlide() {
    // if (currentIndex < widget.data.length - 1) {
    //   progress[currentIndex] = 1;
    //   currentIndex++;
    //   pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.decelerate);
    // } else {
    //   progress[currentIndex] = 1;
    //   timer!.cancel();
    // }
    scrollController.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (Responsive.isDesktop(context)) {
      return _buildDesktop();
    } else {
      return _buildMobileTabletVersion();
    }
  }

  Widget _buildDesktop() => Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: kAppColors[4],
            surfaceTintColor: kPrimaryColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Positioned(
                //   top: positionTop,
                //   left: positionLeft,
                //   right: positionRight,
                //   child: TimerBar(data: widget.data, percentage: progress),
                // ),
                Positioned(
                  top: positionTop + 20,
                  left: 0,
                  right: 0,
                  bottom: positionBottom + 10,
                  child: InformationLayout(
                    data: widget.data,
                    previousArrowEvent: previousSlide,
                    nextArrowEvent: nextSlide,
                    pageController: scrollController,
                  ),
                ),
                // Positioned(
                //   top: positionTop + 20,
                //   left: positionLeft + 10,
                //   child: PlayPause(
                //     startStop: () {
                //       _watchingProgress();
                //       if (timer!.isActive == false) {
                //       } else {
                //         timer!.cancel();
                //       }
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );

  Widget _buildMobileTabletVersion() => Stack(
        children: [
          CarouselSlider(
            carouselController: scrollController,
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 1,
              enlargeFactor: 2,
              height: 340,
            ),
            items: Responsive.isTablet(context)
                ? splitListIntoPairs(widget.data)
                    .map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: e
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: EventCard(
                                      event: e,
                                    ),
                                  ))
                              .toList(),
                        ))
                    .toList()
                : (widget.data)
                    .map((e) => Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: EventCard(
                              event: e,
                            ),
                          ),
                        ))
                    .toList(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimatedOpacityWhenHovered(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.keyboard_arrow_left_outlined),
                    onPressed: () {
                      scrollController.previousPage();
                    },
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimatedOpacityWhenHovered(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {
                      scrollController.nextPage();
                    },
                    icon: const Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ),
              ),
            ),
          )
        ],
      );

  @override
  bool get wantKeepAlive => true;
}
