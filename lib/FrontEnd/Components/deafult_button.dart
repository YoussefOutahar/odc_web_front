import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.imageSrc,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String imageSrc, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20 * 2.5,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: const Color(0xFFE8F0F9),
      onPressed: press,
      child: Row(
        children: [
          // Image.asset(imageSrc, height: 40),
          // const SizedBox(width: 20),
          Text(text),
        ],
      ),
    );
  }
}
