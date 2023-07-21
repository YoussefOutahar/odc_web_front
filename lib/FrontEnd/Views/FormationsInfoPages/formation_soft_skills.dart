import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../DataBase/Models/formations.dart';
import '../../../Services/Utils/responsive.dart';
import 'Components/data_grid.dart';
import 'Components/text_card.dart';
import 'Components/text_section_title.dart';

class FormationSoftSkillsInfoPage extends StatefulWidget {
  const FormationSoftSkillsInfoPage({super.key});

  @override
  State<FormationSoftSkillsInfoPage> createState() =>
      _FormationSoftSkillsInfoPageState();
}

class _FormationSoftSkillsInfoPageState
    extends State<FormationSoftSkillsInfoPage> {
  late Formation formation;
  @override
  void initState() {
    formation = formations[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage();
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
          const TextSectionTitle(title: "Pack Certificat PNL"),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: DataGrid(
              name: "PNL",
              whyData:
                  "Maîtriser des techniques d’amélioration et de changement,\n"
                  "Modéliser des stratégies d’excellence et de motivation, \n"
                  "Transformer des comportements indésirables en attitudes positives,\n"
                  "Passer d’un état présent à un état désiré, \n"
                  "Libérer ses potentialités et capacités.\n",
              publicCibleData:
                  "Les Coachs, les professionnels de la communication, de la santé, de l'éducation, du sport, de la relation d'aide sont concernés par la PNL. Toute personne exerçant une fonction d'encadrement, chefs d'entreprises, managers et cadres .., ainsi que toute personne considérant la communication comme un élément important de son activité et de sa vie.",
              objectifsPedagogiqueData:
                  "Savoir et comprendre les sources de la PNL, son historique et son évolution.\n"
                  "Savoir et pratiquer le travail dans un cadre objectif.\n"
                  "Savoir et comprendre à mieux communiquer avec les différents systèmes de représentation.\n"
                  "Prendre conscience de l'index de computation et ses différents champs d'application.\n"
                  "Apprendre à appliquer la calibration dans son intervention.\n"
                  "Apprendre à appliquer les différentes formes de synchronisation.\n"
                  "Apprendre à mieux établir le rapport avec son client.\n"
                  "Savoir et comprendre les méta-programmes de base.\n"
                  "Savoir à intervenir en utilisant la triple description.\n"
                  "Savoir et appliquer la technique de stratégie de Disney\n",
              certificationData:
                  "Le candidat sera certifié en ayant satisfait les normes de compétence de l'INLPTA et de AMERICAN BOARD ; du diplôme de PNL, telles qu'évaluées par le formateur enregistré.",
              programData: "1.Sources de la PNL.\n"
                  "2.Historique PNL.\n"
                  "3.Evolution de la PNL.\n"
                  "4.Définition de la PNL.\n"
                  "5.Présuppositions PNL.\n"
                  "6.Les piliers de la PNL.\n"
                  "7.L'échelle d'apprentissage.\n"
                  "8.Cadres PNL.\n"
                  "9.Index de computation.\n"
                  "10. État présent et état désiré.\n"
                  "11. Gestion état interne.\n"
                  "12. Formule de Changement PNL.\n"
                  "13. Les conditions de la bonne formulation d'un 	objectif.\n"
                  "14. Gain secondaire.\n"
                  "15. Ecologie comportementale.\n"
                  "16. Le VAKOG.\n"
                  "17. Les systèmes de représentation.\n"
                  "18. Acuité sensorielle.\n"
                  "19. Macro-Calibration et Micro-Calibration.\n"
                  "20. Prédicats.\n"
                  "21. Mouvements Oculaires.\n"
                  "22. Introduction (Méta Programmes ).\n"
                  "23. Synchronisation.\n"
                  "24. Rapport.\n"
                  "25. Conscience interne et conscience externe.\n"
                  "26. Stratégie Betty Erickson.\n"
                  "27. Auto-Ancrage.\n"
                  "28. Association Dissociation.\n"
                  "29. Générateur de nouveaux comportements.\n"
                  "30. Triple Description (Position Perceptuelles).\n"
                  "31. Stratégie de Disney.\n"
                  "32. Cercle d'excellence.\n",
              dureeData: "20h sur  4j ( 2 Week end)\n"
                  "Vendredi 19h00 - 21h00\n"
                  "Samedi 9h00 - 17h00\n",
              lieuData: "Rabat",
              tarifData: "Pour les particuliers : 5000 DH.\n"
                  "Pour les entreprise la formation est facturé au prix 7000 DH/ HT\n",
              cvAnimateur: "Ingénieur d’état grade principal.\n"
                  "Enseignant PNL certifié par INLPTA et ABNLP.\n"
                  "Master Coach PNL ABNLP.\n"
                  "Coach PCC Certifié ICF.\n"
                  "Coach Senior Praticien EMCC.\n"
                  "Mentor de Coach ICF.\n"
                  "Assesseur ICF.\n"
                  "Certifié aux outils psychométriques (DISC, WPMOT) Par TTI Success Insights France.\n"
                  "Certifié en Analyse Transactionnelle par l’IFAT (Institut Français de l’Analyse Transactionnelle) Certifié en Analyse.\n"
                  "Transactionnelle par EATA (European Association of Transactionnel Analysis).\n"
                  "Certifié  PMP (Project Management Professional) par PMI (Project Management Institute) Pennsylvanie USA.\n",
              contactData:
                  "Pour savoir comment s’inscrire; Veuillez nous contacter au : \n"
                  "06 41 86 59 12\n"
                  "06 41 58 85 05\n",
              coutData: '--------',
            ),
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
          const TextSectionTitle(title: "Pack Innovation & Business"),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: DataGrid(
              name: "Business & Innovation",
              whyData: "La formation permet aux participants de : \n"
                  "Avoir l’opportunité de proposer un projet entrepreneurial en cohérence avec leur personnalité et bilan professionnel;\n"
                  "Se servir des outils modernes d'innovation et de création d’entreprise dans un monde influencé par le digital; \n"
                  "Apprendre des éléments théoriques et pratiques  importants et aussi les outils nécessaires pour passer à l'action.\n",
              publicCibleData: "Créateur d'une entreprise ;\n"
                  "Participation aux premières phases de développement d'une start-up dans l'équipe de direction (en étant, ou non associé) ;\n"
                  "Consultant spécialisé dans l'accompagnement des jeunes entreprises ;\n"
                  "Manager de structures d'appui à la création d'entreprises (incubateurs, accélérateurs, pépinières...) ;\n"
                  "Cadre au sein des directions de l'innovation ou équivalent au sein de grandes entreprises.\n",
              objectifsPedagogiqueData:
                  "Créer une entreprise, qu'il s'agisse d'une entreprise 'classique' ou d'une start-up technologique;\n"
                  "Conseiler et accompagnier les créateurs d'entreprise, appui à l'intrapreneuriat;\n"
                  "Gérer les projets entrepreneuriaux à la fois par la mise en pratique, la prise de recul et la maîtrise des principaux outils et démarches propres à la création d'entreprise ou la conduite de projets innovants au sein d'organisations existantes.\n",
              certificationData: "Certificat en Business & Innovation",
              programData:
                  "Outils modernes de la créativité, de l'entrepreneuriat et de l'innovation.\n"
                  "Pratiques de gestion pour prendre un projet entrepreneurial de la conception à la validation pour un marché potentiel. \n"
                  "Outils de sa mise en œuvre (Business plan, Business model …) \n"
                  "Principes du Lean Start-up pour amener un projet rapidement vers le marché. \n"
                  "Ecosystème de l'innovation et de l'entrepreneuriat au Maroc. \n"
                  "Activités pratiques\n",
              dureeData: "20h sur  4j ( 2 Week end)\n"
                  "Vendredi 19h00 - 21h00\n"
                  "Samedi 9h00 - 17h00\n",
              lieuData: "Rabat",
              tarifData: "Pour les particuliers : 5000 DH.\n"
                  "Pour les entreprises la formation est facturé au prix 7000 DH/ HT\n",
              cvAnimateur: "----------",
              contactData:
                  "Pour savoir comment s’inscrire; Veuillez nous contacter au : \n"
                  "06 41 86 59 12\n"
                  "06 41 58 85 05\n",
              coutData: '--------',
            ),
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
          const TextSectionTitle(title: "Pack Santé sociale et bien être"),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: DataGrid(
              name: "Santé sociale et bien être",
              whyData: "Assurer son bien être sur les réseaux sociaux;\n"
                  "Gérer l’intimidation numérique et continuer de profiter des réseaux sociaux;\n"
                  "Acquérir les bons réflexes pour faire face à une situation d’intimidation;\n"
                  "Accompagnement individualisé offert.\n",
              publicCibleData: "Influenceurs et influeuseuses;\n"
                  "Tout public intéressé par la formation\n",
              objectifsPedagogiqueData:
                  "Reconnaître les situations d’intimidation en vie sociale et sur les réseaux sociaux;\n"
                  "Poser des gestes de prévention;\n"
                  "Maîtriser les outils de création de son environnement sûr et sain;\n"
                  "Rechercher l’équilibre entre le bien être physique, mental et social;\n"
                  "Renforcer les comportements et la mise en place d’un environnement favorisant la santé sociale ;\n"
                  "Découvrir les droits, les recours et les conséquences du point de vue légal en matière d’intimidation.\n"
                  "Constater le rôle crucial d’un témoin direct ou indirect;\n",
              certificationData:
                  "Attestation de participation offerte à la fin de la formation.", //TODO change to attestation
              dureeData: "20h sur  4j ( 2 Week end) \n"
                  "Vendredi 19h00 - 21h00\n"
                  "Samedi 9h00 - 17h00\n",
              lieuData: "Rabat",
              tarifData: "Pour les particuliers : 5000 DH.\n"
                  "Pour les entreprises la formation est facturé au prix 7000 DH/ HT\n",
              cvAnimateur: "---------",
              contactData:
                  "Pour savoir comment s’inscrire; Veuillez nous contacter au : \n"
                  "06 41 86 59 12\n"
                  "06 41 58 85 05\n",
              coutData: '--------',
              programData: '--------',
            ),
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
          const TextSectionTitle(title: "Pack Prise de décision"),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: DataGrid(
              name: "Prise de décision",
              whyData:
                  "Cette formation apporte une méthodologie et de nombreux outils pour prendre des décisions efficaces quelles que soient vos problématiques.\n"
                  "Les participants travaillent sur des décisions réelles, pour mieux s'approprier les mécanismes parfois inconscients et expérimenter la puissance des outils.\n"
                  "Des outils pratiques et opérationnels, utilisables seul ou en groupe.\n",
              publicCibleData:
                  "Toute personne souhaitant optimiser sa prise de décision.",
              objectifsPedagogiqueData:
                  "Agir à bon escient dans le processus de décision.\n"
                  "Utiliser des outils d'analyse et des méthodes de créativité pour résoudre des problèmes.\n"
                  "Gérer les dimensions rationnelle et émotionnelle de la décision.\n",
              certificationData:
                  "Attestation de la formation", //TODO change to attestation
              programData: "Jour 1: Design thinking\n"
                  "Introduction à la prise de décision\n"
                  "Modélisation du  processus de Design Thinking  et des processus d’analyse\n"
                  "Identifier les différents types et caractéristiques des processus décisionnels\n"
                  "Présentation des 10 règles de Design Thinking\n"
                  "Processus de résolution des  problèmes \n"
                  "Définir les approches de résolution d’un problème \n"
                  "Jour 2: Outils de base de prise de décision\n"
                  "Autodiagnostic\n"
                  "Décider de décider !\n"
                  "Écouter son intuition.\n"
                  "Identifier les personnes légitimes à prendre la décision.\n"
                  "Provoquer un déclic pour obtenir un 'go' processus de décision.\n"
                  "Définir la problématique à résoudre\n"
                  "Clarifier un problème confus avec questionnement puissant.\n"
                  "Fractionner les décisions complexes.\n"
                  "Délimiter son pouvoir de décision.\n"
                  "Définir la question paradoxale qui résume le problème sous forme de défi positif.\n"
                  "Jour 3: \n"
                  "Explorer les solutions\n"
                  "Animer un brainstorming en groupe.\n"
                  "Libérer la pensée créatrice avec la carte mentale.\n"
                  "Sortir des blocages et dépasser les solutions évidentes avec des techniques de créativité spécifiques.\n"
                  "Choisir une solution\n"
                  "Repérer les biais cognitifs qui risquent de fausser la décision.\n"
                  "Définir des critères de décision, comparer et combiner les solutions pour parvenir à un choix satisfaisant.\n"
                  "Provoquer un déclic émotionnel pour gérer la résistance à la prise de risque et passer de la solution à la décision.\n"
                  "Utiliser une méthode puissante pour imaginer le plan d’action avant de le formaliser.\n",
              dureeData: "10h sur  2j ( 2 Week end) \n"
                  "Vendredi 19h00 - 21h00\n"
                  "Samedi 9h00 - 17h00\n",
              lieuData: "Rabat",
              tarifData: "Pour les particuliers : 2 000DH.\n"
                  "Pour les entreprises la formation est facturé au prix 7000 DH/ HT\n",
              cvAnimateur: "----------",
              contactData:
                  "Pour savoir comment s’inscrire; Veuillez nous contacter au : \n"
                  "06 41 86 59 12\n"
                  "06 41 58 85 05\n",
              coutData: '--------',
            ),
          ),
          const SizedBox(height: 20),
        ],
      );

  Widget _buildExplanationImage(BuildContext context, Size size) =>
      Responsive.isMobile(context)
          ? Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/formations/soft_skills.png",
                width: size.width / 2,
                height: size.height / 2,
              ),
            )
          : const SizedBox.shrink();
}
