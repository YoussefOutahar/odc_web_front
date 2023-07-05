import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      padding: const EdgeInsets.symmetric(horizontal: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("About us",
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const AboutSectionText(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                ),
              ),
            ],
          ),
          const SizedBox(height: 20 * 3),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     DefaultButton(
          //       imageSrc: "assets/images/hand.png",
          //       text: "Hire Me!",
          //       press: () {},
          //     ),
          //     const SizedBox(width: 20 * 1.5),
          //     DefaultButton(
          //       imageSrc: "assets/images/download.png",
          //       text: "Download CV",
          //       press: () {},
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class AboutSectionText extends StatelessWidget {
  const AboutSectionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.normal, height: 3, color: Colors.black),
      ),
    );
  }
}
