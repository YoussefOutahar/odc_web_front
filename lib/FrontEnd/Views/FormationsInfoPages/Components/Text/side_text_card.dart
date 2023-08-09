import 'package:flutter/material.dart';

import '../../../../../Services/constants.dart';

class SideTextCard extends StatelessWidget {
  const SideTextCard(
      {super.key, required this.icon, required this.title, required this.text});

  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 200,
        minWidth: 300,
      ),
      child: Card(
        child: Container(
          color: kPrimaryColor.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: kDefaultPadding),
                Text(text, textAlign: TextAlign.center),
                const SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
