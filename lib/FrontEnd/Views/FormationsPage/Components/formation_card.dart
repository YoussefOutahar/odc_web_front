import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../Components/deafult_button.dart';

class ForamationCard extends StatelessWidget {
  const ForamationCard(
      {super.key,
      required this.packs,
      required this.press,
      required this.imageSrc});

  final String packs;
  final VoidCallback press;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 900,
      height: 400,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Image.asset(
              imageSrc,
              fit: BoxFit.cover,
              width: 900,
              height: 400,
            ),
            Center(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    margin: const EdgeInsets.all(40.0),
                    child: Center(
                      child: Text(
                        packs,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultButton(
                  press: press,
                  text: 'Learn more',
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/odc_pattern3.png",
                  scale: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
