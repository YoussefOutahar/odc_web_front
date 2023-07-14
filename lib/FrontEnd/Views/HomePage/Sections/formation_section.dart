import 'package:flutter/material.dart';

import '../../../Components/section_title.dart';
import '../../../../DataBase/Models/formations.dart';
import '../Components/formation_card.dart';

class Formations extends StatelessWidget {
  const Formations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20 * 6),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SectionTitle(
            title: "Formations",
            subTitle: "Nos formations",
            color: Color(0xFFFFB100),
          ),
          const SizedBox(height: 20 * 1.5),
          Wrap(
            spacing: 20,
            runSpacing: 20 * 2,
            children: List.generate(
              formations.length,
              (index) => FormationCard(index: index, press: () {}),
            ),
          ),
          const SizedBox(height: 20 * 5),
        ],
      ),
    );
  }
}
