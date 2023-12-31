import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.color,
  }) : super(key: key);

  final String title, subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        constraints: const BoxConstraints(maxWidth: 1110),
        height: 100,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.only(bottom: 72),
              width: 8,
              height: 100,
              color: Colors.black,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
