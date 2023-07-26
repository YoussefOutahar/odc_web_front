import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../Services/Utils/responsive.dart';

class FormationHeader extends StatelessWidget {
  const FormationHeader({super.key, required this.title, required this.imgSrc});

  final String title;
  final String imgSrc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            imgSrc,
            filterQuality: FilterQuality.high,
            width: double.maxFinite,
            height: Responsive.isDesktop(context)
                ? size.height / 1.3
                : Responsive.isTablet(context)
                    ? size.height / 1.6
                    : size.height / 2,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.isDesktop(context)
                            ? 60
                            : Responsive.isTablet(context)
                                ? 40
                                : 30,
                      ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
