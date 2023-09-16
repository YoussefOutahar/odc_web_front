import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../../Services/Utils/responsive.dart';
import '../../Services/cached_image_service.dart';
import 'Buttons/deafult_button.dart';
import 'image_clipper.dart';

class PageHeader extends StatelessWidget {
  const PageHeader(
      {super.key,
      required this.title,
      required this.imgSrc,
      required this.subTitle,
      this.press,
      this.showButton = false,
      required this.size});

  final String imgSrc;
  final String title;
  final String subTitle;
  final VoidCallback? press;
  final bool showButton;
  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height:
          Responsive.isMobile(context) ? size.height * 0.5 : size.height * 0.9,
      child: Stack(
        children: [
          Positioned.fill(
            // width: size.width,
            child: ImageManager(imageUrl: imgSrc),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: ImageClipper(),
              child: Container(
                width: size.width,
              ).blurred(blur: 5, blurColor: Colors.white),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: size.height * 0.05),
                if (showButton)
                  DefaultButton(
                    press: press ?? () {},
                    text: "Learn More",
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
