import 'package:flutter/material.dart';

import '../../Animations/delayed_widget.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: const Color.fromRGBO(228, 87, 46, 1),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/odc_pattern5.png",
            ),
          ),
          const Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DelayedWidget(
                  delayDuration: Duration(milliseconds: 500),
                  from: DelayFrom.bottom,
                  child: SelectableText(
                    "Optima Decision Consulting",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                DelayedWidget(
                  delayDuration: Duration(milliseconds: 800),
                  from: DelayFrom.bottom,
                  child: SelectableText(
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
          )
        ],
      ),
    );
  }
}
