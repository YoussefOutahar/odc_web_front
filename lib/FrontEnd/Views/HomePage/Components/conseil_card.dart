import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    Key? key,
    required this.numOfExp,
  }) : super(key: key);

  final String numOfExp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      height: 240,
      width: 255,
      decoration: const BoxDecoration(
        color: Color(0xFFF7E8FF),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFEDD2FC),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              color: const Color(0xFFA600FF).withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text(
                  numOfExp,
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = const Color(0xFFDFA3FF).withOpacity(0.5),
                    shadows: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        color: const Color(0xFFA600FF).withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                Text(
                  numOfExp,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 100,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20 / 2),
            const Text(
              "Years of Experience",
              style: TextStyle(
                color: Color(0xFFA600FF),
              ),
            )
          ],
        ),
      ),
    );
  }
}
