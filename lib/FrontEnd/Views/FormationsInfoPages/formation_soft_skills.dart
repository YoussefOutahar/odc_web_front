import 'package:flutter/material.dart';

import '../../../DataBase/Models/formations.dart';
import '../../../Services/Utils/responsive.dart';
import 'Components/data_grid.dart';
import 'Components/formation_header.dart';
import 'Components/text_section_title.dart';
import 'data.dart';

class FormationSoftSkillsInfoPage extends StatefulWidget {
  const FormationSoftSkillsInfoPage({super.key});

  @override
  State<FormationSoftSkillsInfoPage> createState() =>
      _FormationSoftSkillsInfoPageState();
}

class _FormationSoftSkillsInfoPageState
    extends State<FormationSoftSkillsInfoPage> {
  late Formation formation;

  String formation1 = "Pack Certificat PNL";
  String formation2 = "Pack Innovation & Business";
  String formation3 = "Pack Santé sociale et bien être";
  String formation4 = "Pack Prise de décision";
  @override
  void initState() {
    formation = formations[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _buildPage(size);
  }

  Widget _buildPage(Size size) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.translate(
            offset: const Offset(0, -kToolbarHeight * 1.2),
            child: FormationHeader(
              imgSrc: formation.image,
              title: formation.title,
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DataGrid(
              name: FormationData.formationDoctorantData[formation1]!["name"],
              whyData:
                  FormationData.formationDoctorantData[formation1]!["whyData"],
              publicCibleData: FormationData
                  .formationDoctorantData[formation1]!["publicCibleData"],
              objectifsPedagogiqueData: FormationData.formationDoctorantData[
                  formation1]!["objectifsPedagogiqueData"],
              certificationData: FormationData
                  .formationDoctorantData[formation1]!["certificationData"],
              programData: FormationData
                  .formationDoctorantData[formation1]!["programData"],
              cvAnimateur: FormationData
                  .formationDoctorantData[formation1]!["cvAnimateur"],
              dureeData: FormationData
                  .formationDoctorantData[formation1]!["dureeData"],
              lieuData:
                  FormationData.formationDoctorantData[formation1]!["lieuData"],
              tarifData: FormationData
                  .formationDoctorantData[formation1]!["tarifData"],
              coutData:
                  FormationData.formationDoctorantData[formation1]!["coutData"],
              contactData: FormationData
                  .formationDoctorantData[formation1]!["contactData"],
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
