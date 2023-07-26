import 'package:flutter/material.dart';

import '../../../DataBase/Models/formations.dart';
import '../../../Services/Utils/responsive.dart';
import 'Components/data_grid.dart';
import 'Components/formation_header.dart';
import 'Components/text_section_title.dart';

class FormationDoctorantInfoPage extends StatefulWidget {
  const FormationDoctorantInfoPage({super.key});

  @override
  State<FormationDoctorantInfoPage> createState() =>
      _FormationDoctorantInfoPageState();
}

class _FormationDoctorantInfoPageState
    extends State<FormationDoctorantInfoPage> {
  late Formation formation;
  @override
  void initState() {
    formation = formations[2];
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
          const TextSectionTitle(
              title: "Boîte à outils recherche scientifique"),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: DataGrid(
              name: "outils de recherche scientifique",
              whyData: "Maîtrise des clés de la recherche scientifique\n"
                  "Suivi de formation certifiante approfondie en outils de recherche scientifique\n"
                  "Fondement d’un construit solide des travaux scientifiques\n"
                  "Développement des acquis pertinents en recherche scientifique selon les domaines de spécialité\n"
                  "Un accompagnement individuel possible.\n",
              publicCibleData: "Doctorants en Management\n"
                  "Doctorants en Ingénierie\n",
              objectifsPedagogiqueData:
                  "Maîtriser le protocole de la recherche scientifique\n"
                  "Maîtriser les exigences académiques pour la réussite de la rédaction des travaux scientifiques ( Rapport d’avancement, thèse, articles scientifiques…)\n"
                  "Maîtriser les techniques de reformulation et de réécriture des travaux scientifiques ( Thèses, Articles scientifiques…) et éliminer le plagiat\n"
                  "Maîtriser les logiciels de gestion des références et de la bibliographie (Zotero, Endnote…)\n"
                  "Maîtriser les outils d’analyse scientifique (Qualitative, quantitative) \n",
              certificationData: "Attestation avec volume horaire (6h/jr)",
              programData: "PROTOCOLE DE LA RECHERCHE SCIENTIFIQUE\n"
                  "Ethique plagiat  selon la norme APA/ Différents logiciels (Manières de détection, seuils de tolérance , sanctions)\n"
                  "Types de reformulation et réécriture\n"
                  "Techniques de reformulation et réécriture selon les disciplines (Sciences humaines et sociales, sciences exactes…)\n"
                  "GESTION BIBLIOGRAPHIQUE\n"
                  "Découverte des principales fonctionnalités des logiciels de gestion des références et de la bibliographie (Zotero, Endnote…)\n"
                  "Collection, gestion et production de liste de références et leur création et récupération automatiquement\n"
                  "Outils de rédaction scientifique ( LaTex,...)\n"
                  "ANALYSE et MODELISATION  QUALITATIVE ET QUANTITATIVE\n"
                  "Techniques et méthodes de traitement et analyse qualitative et quantitative ( Questionnaire, Interview, Nvivo, Spss, VosViewe,  )\n"
                  "Modélisation mathématique et programmation mathématique\n",
              cvAnimateur: "Formateurs en langues (française , anglaise)\n"
                  "Professeurs Universitaires\n"
                  "Ingénieurs ( Analyse technique et logiciels…)\n",
              dureeData: "Par Option : 12h/2 Jrs\n"
                  "Par Pack : 30 h/mois\n",
              lieuData: "Distantiel\n",
              tarifData: "1 000 dh/personne/ Option\n"
                  "2  000 dh/personne/ Pack\n",
              coutData:
                  "Intervenant : 6 000dh / option                12 000dh/Pack",
              contactData: "•Formulaire à remplir en ligne\n"
                  "•Confirmation par paiement\n"
                  "  Pour étudiants au Maroc : Versement ou virement au RIB\n"
                  "  Pour étudiants à l’étranger : Mandat WU/ MoneyG/Paypal\n",
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
          const TextSectionTitle(
              title: "Boîte à outils Méthodologie & encadrement"),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: DataGrid(
              name: "outils Management de la recherche ",
              whyData:
                  "•Développement des techniques et procédures d’identification et analyse des informations des sujets de recherche spécifique\n"
                  "•Maintien de la conception d’étude pour l’obtention des résultats\n"
                  "•Maîtrise de la démarche des choix méthodologiques et leur justification argumentaire, selon les objectifs assignés de la recherche\n"
                  "•Evaluation de la fiabilité et la validité des études en fonction de la pertinence et de l’efficacité des procédures employées\n",
              publicCibleData: "•Doctorants en Management\n"
                  "•Doctorants en ingénierie\n",
              objectifsPedagogiqueData:
                  "•Maîtriser les démarches méthodologiques appropriées aux études scientifiques menées\n"
                  "•Assurer l’évaluation de la fiabilité et la validité des études en fonction de l’efficacité et la pertinence des techniques utilisées\n"
                  "•Développer un accompagnement méthodique et méthodologique du processus d’élaboration de thèse doctorale\n"
                  "•Mener un encadrement ponctuel des différents phases de la recherche scientifique \n",
              certificationData:
                  "Attestation avec volume horaire (6h/1jr)", //TODO : change this to attestation
              programData: "•ESPRIT ET MORAL\n"
                  "-Comment développer un état d’esprit chercheur ?\n"
                  "-Motivation, Méthodologie et guide pratique avec planification ( Court, moyen et long terme )\n"
                  "•GESTION ET MANAGEMENT\n"
                  "-Gestion du temps et planification\n"
                  "-Gestion du stress et des périodes de démotivation\n"
                  "-Management d’enchaînement des travaux de recherche de la collecte d’information (théorique et empirique), la rédaction scientifique, à la finalisation de la thèse\n"
                  "•TECHNIQUES D'ÉVALUATION ET CAS PRATIQUES\n"
                  "-Techniques d’évaluation de la pertinence et la validité d’étude scientifique\n"
                  "-Traitement des cas pratiques sur les procédures et choix méthodologie\n",
              cvAnimateur: "Formateurs \n"
                  "Professeurs Universitaires\n",
              dureeData: "--------",
              lieuData: "--------",
              tarifData: "------------",
              coutData: "--------------",
              contactData: "-----------",
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
          const TextSectionTitle(
              title: "Boîte à outils Enseignement supérieur et pédagogie"),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: DataGrid(
              name: "outils Enseignement supérieur et pédagogie ",
              whyData:
                  "•Développement de connaissances, compréhension et maîtrise des exigences liées à la pédagogie universitaire\n"
                  "•Disposition des outils  d’enseignement supérieur  menant à l’efficacité et la pertinence d’application\n"
                  "•Bénéficier d’un programme de formation varié et assuré par des spécialistes en pédagogie et enseignement universitaire\n",
              publicCibleData: "Doctorants et Docteurs\n"
                  "Enseignants vacataires\n"
                  "Enseignants universitaires\n",
              objectifsPedagogiqueData:
                  "•Prise de connaissance des initiations à la pédagogie universitaire\n"
                  "•\n"
                  "•Développement des méthodes d’enseignement à partir des théories d’apprentissage ( Piaget, Mager, Vygotsky…)\n"
                  "•Accompagnement pour amélioration des outils de préparation des cours et supports de formation, évaluations et examens.\n"
                  "•Application d’une approche systémique de la préparation pédagogique\n",
              certificationData:
                  "Attestation d’aptitude de la pédagogie universitaire", //TODO : change this to attestation
              programData: "•INITIATION A LA PÉDAGOGIE UNIVERSITAIRE\n"
                  "-La pédagogie universitaire\n"
                  "-L’enseignement à l’université\n"
                  "-L ’enseignement et l’apprentissage à l’université : Quels rapports ?\n"
                  "-Les atouts des théories de l’apprentissage ( Piaget, Mager…)\n"
                  "-La relation enseignant-étudiant : Motivation, accompagnement, encadrement …\n"
                  "•PRÉPARATION DU COURS ET SUPPORT DE FORMATION\n"
                  "-l’approche systémique de la préparation pédagogique\n"
                  "-La détermination des objectifs pédagogiques\n"
                  "-Le choix des contenus, des méthodes et techniques d’enseignement\n"
                  "-L’évaluation des enseignements et des acquis des étudiants\n",
              cvAnimateur: "•Spécialistes de la pédagogie universitaire\n"
                  "•Formateurs certifiés dans le domaine\n",
              dureeData: "--------",
              lieuData: "--------",
              tarifData: "------------",
              coutData: "--------------",
              contactData: "-----------",
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
                "assets/images/formations/doctorants.png",
                width: size.width / 2,
                height: size.height / 2,
              ),
            )
          : const SizedBox.shrink();
}
