import 'package:flutter/material.dart';

import '../../../../DataBase/Models/service.dart';
import '../../../Components/section_title.dart';
import '../Components/service_card.dart';

class Services extends StatelessWidget {
  const Services({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      child: Column(
        children: [
          const SectionTitle(
            color: Color(0xFFFF0000),
            title: "Service Offerings",
            subTitle: "My Strong Arenas",
          ),
          Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20 * 2,
              children: List.generate(
                  services.length, (index) => ServiceCard(index: index)),
            ),
          )
        ],
      ),
    );
  }
}
