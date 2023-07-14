import 'package:flutter/material.dart';

import '../../../../Services/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (Responsive.isMobile(context)) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20 * 2),
        padding: const EdgeInsets.symmetric(horizontal: 20 * 2),
        constraints: const BoxConstraints(maxWidth: 1110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("About us", style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(
              height: 40,
            ),
            const AboutSectionText(
              text: "OptimaDecision Consulting (ODC) est une entreprise marocaine spécialisée dans l'optimisation et l’amélioration de la Supply Chain. Nous proposons une gamme complète de services : l’optimisation et l'ingénierie de la chaîne logistique, la simulation des différents maillons de la Supply Chain, les méthodes de  Lean Management, l'accompagnement des entreprises dans l'obtention des divers certifications ISO et la création des Labels. " +
                  "Notre approche unique et notre engagement à fournir un service de haute qualité permettront à nos clients de réaliser des résultats exceptionnels.",
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20 * 2),
        padding: const EdgeInsets.symmetric(horizontal: 20 * 2),
        constraints: const BoxConstraints(maxWidth: 1110),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("About us",
                    style: Theme.of(context).textTheme.displayMedium),
                SizedBox(
                  width: size.width / 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: const AboutSectionText(
                    text: "OptimaDecision Consulting (ODC) est une entreprise marocaine spécialisée dans l'optimisation et l’amélioration de la Supply Chain. Nous proposons une gamme complète de services : l’optimisation et l'ingénierie de la chaîne logistique, la simulation des différents maillons de la Supply Chain, les méthodes de  Lean Management, l'accompagnement des entreprises dans l'obtention des divers certifications ISO et la création des Labels. " +
                        "Notre approche unique et notre engagement à fournir un service de haute qualité permettront à nos clients de réaliser des résultats exceptionnels.",
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
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
            fontWeight: FontWeight.normal, color: Colors.black, height: 1.5),
      ),
    );
  }
}
