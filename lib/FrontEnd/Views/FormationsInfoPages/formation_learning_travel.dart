import 'package:flutter/material.dart';

import '../../../DataBase/Models/formations.dart';
import '../../../Services/Utils/responsive.dart';

class FormationLearningTravelInfoPage extends StatefulWidget {
  const FormationLearningTravelInfoPage({super.key});

  @override
  State<FormationLearningTravelInfoPage> createState() =>
      _FormationLearningTravelInfoPageState();
}

class _FormationLearningTravelInfoPageState
    extends State<FormationLearningTravelInfoPage> {
  late Formation formation;
  @override
  void initState() {
    formation = formations[3];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: _buildPage(),
    );
  }

  Widget _buildPage() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            formation.image,
            width: double.maxFinite,
            height: 400,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            formation.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              formation.category,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(height: 20),
          const TextSectionTitle(title: "Voyage Programmation Informatique"),
          const SizedBox(height: 20),
          ..._buildTextSection(
            name: "Programmation Informatique",
            whyData: "Initiation aux bases du développement informatique\n"
                "Acquisition de compétences en création d'applications et solutions logicielles\n"
                "Apprentissage des principes de programmation et des outils collaboratifs\n"
                "Favoriser la polyvalence des compétences pour s'adapter à divers secteurs d'activité\n"
                "Encourager la créativité et la résolution de problèmes grâce à la maîtrise de la programmation\n",
            publicCibleData: "Débutants en développement informatique\n"
                "Professionnels en reconversion\n"
                "Personnes souhaitant compléter leurs compétences avec la programmation\n",
            objectifsPedagogiqueData:
                "Comprendre les concepts fondamentaux de la programmation\n"
                "Se familiariser avec un langage de programmation spécifique\n"
                "Développer des applications simples\n"
                "Appliquer les bonnes pratiques de développement\n"
                "Utiliser les outils de travail collaboratif et de gestion de projet\n",
            certificationData: "--------------",
            programData: "Jour 1: Introduction et fondamentaux\n"
                "Introduction au développement informatique \n"
                "Concepts fondamentaux de la programmation \n"
                "Présentation du langage de programmation choisi\n"
                "Jour 2: Développement pratique et bonnes pratiques\n"
                "Environnement de développement et outils \n"
                "Syntaxe et structures de contrôle \n"
                "Pause déjeuner \n"
                "Fonctions, classes et objets\n"
                "Bonnes pratiques de développement \n"
                "Jour 3: Projets et travail collaboratif\n"
                "Introduction aux bibliothèques et frameworks \n"
                "Travailler avec des API \n"
                "Projet pratique en groupe \n"
                "Outils de travail collaboratif et gestion de projet\n"
                "Conclusion et évaluation de la formation\n",
            contactData: "--------",
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(height: 20),
          const TextSectionTitle(title: "Voyage entreprenariat"),
          const SizedBox(height: 20),
          ..._buildTextSection(
            name: "entreprenariat",
            whyData:
                "Acquérir les compétences et les connaissances pour devenir un entrepreneur réussi\n"
                "Comprendre les principes de base de l'entrepreneuriat et du démarrage d'entreprise\n"
                "Identifier les opportunités d'affaires et évaluer leur potentiel.\n"
                "Élaborer un plan d'affaires complet.\n"
                "Gérer les finances de votre entreprise, y compris la budgétisation, la comptabilité et le financement\n",
            publicCibleData:
                "Cette formation est destinée à toute personne intéressée par l'entrepreneuriat, qu'il s'agisse d'entrepreneurs débutants ou expérimentés, de cadres d'entreprise ou de travailleurs indépendants.",
            objectifsPedagogiqueData:
                "Au terme de cette formation, vous serez capable de :\n"
                "Comprendre les principes de base de l'entrepreneuriat et du démarrage d'entreprise\n"
                "Identifier les opportunités d'affaires et évaluer leur potentiel\n"
                "Élaborer un plan d'affaires complet\n"
                "Gérer les finances de votre entreprise, y compris la budgétisation, la comptabilité et le financement\n"
                "Développer et commercialiser votre produit ou service\n"
                "Gérer les risques et les défis liés à l'entrepreneuriat\n",
            certificationData: "----------",
            programData: "Jour 1 : Les bases de l'entrepreneuriat\n"
                "Introduction à l'entrepreneuriat\n"
                "Les traits de personnalité d'un entrepreneur réussi\n"
                "Comment générer des idées d'affaires\n"
                "Comment évaluer le potentiel d'une opportunité d'affaires\n"
                "Les différentes formes juridiques d'entreprise\n"
                "Jour 2 : Planification et gestion financière\n"
                "Élaboration d'un plan d'affaires complet\n"
                "Comment établir un budget pour votre entreprise\n"
                "Comptabilité et tenue des registres financiers\n"
                "Sources de financement pour les startups\n"
                "Stratégies fiscales pour les entrepreneurs\n"
                "Jour 3 : Marketing et gestion des risques\n"
                "Comment développer et commercialiser votre produit ou service\n"
                "Les techniques de marketing pour les startups\n"
                "Gestion des risques et des défis dans l'entrepreneuriat\n"
                "Comment établir et gérer des partenariats d'affaires\n"
                "Résumé de la formation et plan d'action pour la suite\n",
            contactData:
                "Pour savoir comment s’inscrire; Veuillez nous contacter au : \n"
                "06 41 86 59 12\n"
                "06 41 58 85 05\n",
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(height: 20),
          const TextSectionTitle(title: "Voyage découverte pédagogique"),
          const SizedBox(height: 20),
          ..._buildTextSection(
            name: "découverte pédagogique ",
            whyData:
                "Voyage de détente et de découverte culturelle de la région pour vocation personnel ou professionnel\n"
                "Apprendre l’artisanat de la région visité\n"
                "Découvrir la partie gastronomique de la région visité\n"
                "Découvrir la richesse de la région \n",
            certificationData: "Certificat de l’artisanat de la région\n"
                "Certificat du management produits du terroir\n",
            contactData:
                "Pour savoir comment s’inscrire; Veuillez nous contacter au : \n"
                "06 41 86 59 12\n"
                "06 41 58 85 05",
          ),
          const SizedBox(height: 20),
        ],
      );

  Widget _buildExplanationImage(BuildContext context, Size size) =>
      Responsive.isMobile(context)
          ? Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/formations/sur_mesures.png",
                width: size.width / 2,
                height: size.height / 2,
              ),
            )
          : const SizedBox.shrink();

  List<Widget> _buildTextSection({
    String name = "",
    String whyData = "",
    String publicCibleData = "",
    String objectifsPedagogiqueData = "",
    String certificationData = "",
    String programData = "",
    String dureeData = "",
    String lieuData = "",
    String tarifData = "",
    String coutData = "",
    String cvAnimateur = "",
    String contactData = "",
  }) =>
      [
        TextSectionTitle(title: "Pourquoi le voyage $name ?"),
        const SizedBox(height: 20),
        TextSectionText(text: whyData),
        const SizedBox(height: 20),
        const TextSectionTitle(title: "Public Cible :"),
        const SizedBox(height: 20),
        TextSectionText(text: publicCibleData),
        const SizedBox(height: 20),
        const TextSectionTitle(title: "Objectifs pédagogique :"),
        const SizedBox(height: 20),
        TextSectionText(text: objectifsPedagogiqueData),
        const SizedBox(height: 20),
        const TextSectionTitle(title: "Certification :"),
        const SizedBox(height: 20),
        TextSectionText(text: certificationData),
        const SizedBox(height: 20),
        const TextSectionTitle(title: "Programme :"),
        const SizedBox(height: 20),
        TextSectionText(text: programData),
        const SizedBox(height: 20),
        const TextSectionTitle(title: "Durée :"),
        const SizedBox(height: 20),
        TextSectionText(text: dureeData),
        const SizedBox(height: 20),
        const TextSectionTitle(title: "Lieu :"),
        const SizedBox(height: 20),
        TextSectionText(text: lieuData),
        const SizedBox(height: 20),
        const TextSectionTitle(title: "Tarif :"),
        const SizedBox(height: 20),
        TextSectionText(text: tarifData),
        const SizedBox(height: 20),
        const TextSectionTitle(title: "Coût :"),
        const SizedBox(height: 20),
        TextSectionText(text: coutData),
        const SizedBox(height: 20),
        const TextSectionTitle(title: "Animateur :"),
        const SizedBox(height: 20),
        TextSectionText(text: cvAnimateur),
        const SizedBox(height: 20),
        const TextSectionTitle(title: "Contacter nous sure :"),
        const SizedBox(height: 20),
        TextSectionText(text: contactData),
      ];
}

class TextSectionTitle extends StatelessWidget {
  const TextSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TextSectionText extends StatelessWidget {
  const TextSectionText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
