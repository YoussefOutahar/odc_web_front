import 'dart:async';

import 'package:flutter/material.dart';
import 'package:odc/Services/constants.dart';

import 'Widgets/information_layout.dart';
import 'Widgets/timer_bar.dart';
import 'slider_data_controller.dart';

class SliderView extends StatefulWidget {
  const SliderView({Key? key}) : super(key: key);

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView>
    with SingleTickerProviderStateMixin {
  final _sliderDataController = SliderDataController();
  PageController pageController = PageController();

  /// Default Progress Index
  int currentIndex = 0;
  List<double> progress = [];

  /// Timers
  Timer? timer;

  /// Default Positions Value
  final double positionTop = 10;
  final double positionLeft = 10;
  final double positionRight = 10;
  final double positionBottom = 10;

  @override
  void initState() {
    super.initState();
    _initSlider();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  _initSlider() {
    for (var _ in _sliderDataController.data) {
      progress.add(0.0);
    }
    _watchingProgress();
  }

  _watchingProgress() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        if (progress[currentIndex] + 0.01 < 1) {
          progress[currentIndex] += 0.01;
        } else {
          progress[currentIndex] = 1;
          timer.cancel();
          pageController.nextPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate);
          if (currentIndex < _sliderDataController.data.length - 1) {
            currentIndex++;
            _watchingProgress();
          } else {
            progress.clear();
            currentIndex = 0;
            pageController.jumpToPage(0);
            _initSlider();
          }
        }
      });
    });
  }

  void previousSlide() {
    if (currentIndex > 0) {
      progress[currentIndex - 1] = 0;
      progress[currentIndex] = 0;
      currentIndex--;
      pageController.previousPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate);
    }
  }

  void nextSlide() {
    if (currentIndex < _sliderDataController.data.length - 1) {
      progress[currentIndex] = 1;
      currentIndex++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate);
    } else {
      progress[currentIndex] = 1;
      timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Center(
        child: Card(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //     // gradient: LinearGradient(
              //     //   colors: [
              //     //     kPrimaryColor,
              //     //     kPrimaryColor.withOpacity(0.5),
              //     //     Colors.white
              //     //   ],
              //     //   begin: Alignment.topCenter,
              //     //   end: Alignment.bottomCenter,
              //     //   tileMode: TileMode.decal,
              //     // ),
              //   ),
              // ),
              Positioned(
                top: positionTop,
                left: positionLeft,
                right: positionRight,
                child: TimerBar(
                    data: _sliderDataController.data, percentage: progress),
              ),
              Positioned(
                top: positionTop + 20,
                left: 0,
                right: 0,
                bottom: positionBottom + 10,
                child: InformationLayout(
                  data: _sliderDataController.data,
                  previousArrowEvent: previousSlide,
                  nextArrowEvent: nextSlide,
                  pageController: pageController,
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
  }
}
