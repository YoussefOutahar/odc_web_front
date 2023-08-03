import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../../Services/Utils/responsive.dart';
import 'Buttons/deafult_button.dart';
import 'image_clipper.dart';

class SectionImage extends StatelessWidget {
  const SectionImage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height:
          Responsive.isMobile(context) ? size.height * 0.5 : size.height * 0.9,
      child: Stack(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/OpenSourceImages/img2.png",
                fit: BoxFit.cover,
                width: size.width,
              ),
              ClipPath(
                clipper: ImageClipper(),
                child: Container(
                  width: size.width,
                ).blurred(blur: 5, blurColor: Colors.white),
              )
            ],
          ),
          Positioned(
            top: Responsive.isMobile(context)
                ? size.height * 0.1
                : size.height * 0.35,
            left: size.width * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello There!",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus,\n luctus nec ullamcorper mattis, pulvinar dapibus leo.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: size.height * 0.05),
                DefaultButton(
                  press: () {},
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
