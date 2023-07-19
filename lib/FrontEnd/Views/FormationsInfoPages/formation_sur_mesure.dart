import 'package:flutter/material.dart';

import '../../../DataBase/Models/formations.dart';
import '../../../Services/Utils/responsive.dart';

class FormationSurMesuresInfoPage extends StatefulWidget {
  const FormationSurMesuresInfoPage({super.key});

  @override
  State<FormationSurMesuresInfoPage> createState() =>
      _FormationSurMesuresInfoPageState();
}

class _FormationSurMesuresInfoPageState
    extends State<FormationSurMesuresInfoPage> {
  late Formation formation;
  @override
  void initState() {
    formation = formations[0];
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
            style: Theme.of(context).textTheme.headlineLarge,
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
          const TextSectionTitle(title: "Pack E-commerce"),
          const SizedBox(height: 20),
          ..._buildTextSection(
            name: "e-commerce",
            whyData:
                "La formation assure aux créateurs et gestionnaires des projets e-commerce : \n"
                "La maîtrise du processus de développement d’un projet e-commerce;\n"
                "Les outils d’analyse et d’aide à la décision nécessaires pour l’amélioration durable de leurs business;\n"
                "Une meilleur compréhension du marché e-commerce;\n"
                "La maîtrise du process d'intégration des EDI; ( les septs modules d'intégration  EDI)\n"
                "Les outils de stratégie et  marketing digital.\n",
            publicCibleData: "Entrepreneurs;\n"
                "Professionnels du marketing et des ventes;\n"
                "Gestionnaires de projets e-commerce;\n"
                "Future créateur de projet e-commerce;\n"
                "Personnes souhaitant améliorer leurs compétences en e-commerce\n",
            objectifsPedagogiqueData:
                "Maîtriser les concepts clés du e-commerce;\n"
                "Acquérir les  compétences de création et la gestion d’un site e-commerce;\n"
                "Comprendre les stratégies du marketing digital et des canaux de promotion;\n"
                "Maîtriser les outils de management des achats et sourcing en e-commerce;\n"
                "Maîtriser les aspects logistiques du business e-commerce;\n"
                "Élaborer les outils d’aide à la décision pour améliorer la performance globale du business e-commerce;\n"
                "Maîtriser  la sécurité en ligne et les réglementations applicables en e-commerce;\n"
                "Améliorer la compétitivité des entreprises sur le marché du commerce électronique;\n"
                "Développer des projets innovants dans le commerce en ligne.\n",
            certificationData:
                "Certificat Executive en Stratégie et Management e-commerce. (CSMEC)\n"
                "Des outils informatiques  sont fournis à la fin de la formation.\n",
            programData: "Introduction au e-commerce et panorama du marché\n"
                "Étude des différents modèles de e-commerce (B2C, B2B, C2C)\n"
                "Conception et création d'une boutique en ligne\n"
                "Choix de la plateforme et des solutions techniques\n"
                "Design et expérience utilisateur\n"
                "Catalogue de produits et gestion des stocks\n"
                "Paiements et logistique\n"
                "Solutions de paiement en ligne\n"
                "Gestion des commandes et des expéditions\n"
                "Gestion des retours et du service client\n"
                "Marketing digital et promotion de la boutique en ligne\n"
                "Référencement naturel (SEO)\n"
                "Publicité en ligne (SEA, réseaux sociaux, e-mailing)\n"
                "Affiliation et partenariats\n"
                "Suivi des performances et optimisation\n"
                "Analyse des données et indicateurs clés de performance (KPI)\n"
                "A/B testing et optimisation de l'expérience utilisateur\n"
                "Stratégies de fidélisation et d'engagement client\n"
                "Maîtrise des coûts\n"
                "Tendances et perspectives du e-commerce\n"
                "Commerce mobile et applications dédiées\n"
                "Intelligence artificielle et personnalisation\n"
                "Réalité augmentée et virtuelle dans le commerce en ligne\n"
                "Processus d'intégration des EDI\n"
                "Forward Logistic\n"
                "Re/Labeling\n"
                "Reverse Logistic\n"
                "Tracking\n"
                "Undelivry\n"
                "Delivery Network\n"
                "COD Report\n"
                "Sécurité et conformité\n"
                "Protection des données personnelles et réglementation (RGPD)\n"
                "Sécurité des transactions et prévention de la fraude\n"
                "Étude de cas et réalisation d'un projet e-commerce en groupe\n"
                "Bilan de la formation et évaluation des compétences acquise\n",
            dureeData: "20h sur  4j ( 2 Week end)\n"
                "Vendredi 19h00 - 21h00\n"
                "Samedi 9h00 - 17h00\n",
            lieuData: "Salle d’un hôtel 4* minimum ou chez l’entreprise\n",
            tarifData: "10 000 dh / personne TTC pour entreprise\n"
                "7 000 dh / personne  pour particulier en présentiel\n"
                "3 500 dh/ personne à distance (minimum)\n"
                "10 personnes minimum.\n",
            coutData: "Intervenant : 12 000 dh\n"
                "Salle de formation 20 000 dh\n"
                "Administration : 15 000 dh\n",
            cvAnimateur: "CV de M. El Youssfi\n",
            contactData: "Tél: 06 41 86 59 12\n"
                "Tél: 06 41 58 85 05\n",
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
          const TextSectionTitle(title: "Pack Lean Management & Six Sigma"),
          const SizedBox(height: 20),
          ..._buildTextSection(
            name: "Lean management & Six Sigma",
            whyData: "La formation  vous permettra  de :\n"
                "Maîtriser les méthodologies et des outils pour optimiser la performance;\n"
                "Assurer l'excellence opérationnelle; \n"
                "Favoriser la culture de l'amélioration continue et de l'efficacité opérationnelle\n"
                "Améliorer la compétitivité des entreprises grâce à une meilleure qualité et réduction des coûts\n"
                "Adapter les compétences aux évolutions rapides des industries et des marchés\n",
            publicCibleData: "Managers et chefs de projet\n"
                "Professionnels de l'assurance qualité et du contrôle qualité\n"
                "Consultants en gestion de projet et amélioration des processus\n"
                "Personnes souhaitant améliorer leurs compétences en Lean Management et Six Sigma\n",
            objectifsPedagogiqueData:
                "Comprendre les principes fondamentaux du Lean Management et Six Sigma\n"
                "Identifier et éliminer les sources de variabilité et d'anomalies;\n"
                "Maîtriser les méthodologies et les outils pour l'amélioration des processus et d’aide à la décision;\n"
                "Développer des compétences en résolution de problèmes et en gestion de projet\n"
                "Encourager la culture de l'amélioration continue et de l'efficacité opérationnelle\n",
            certificationData: "Certificat Lean management et  Six Sigma;\n"
                "Outils informatiques fournis à la fin de la formation. \n",
            programData: "Accueil et présentation des participants\n"
                "Introduction au Lean Management et Six Sigma\n"
                "Les principes du Lean Management\n"
                "Les 5 principes du Lean\n"
                "Identification et élimination des déchets (Muda, Mura, Muri)\n"
                "Les outils Lean (Kaizen, 5S, Kanban, etc.)\n"
                "Les principes du Six Sigma\n"
                "La méthodologie DMAIC (Define, Measure, Analyze, Improve, Control)\n"
                "Les niveaux de certification Six Sigma (Yellow Belt, Green Belt, Black Belt)\n"
                "Les outils statistiques et d'analyse de données\n"
                "Intégration du Lean Management et Six Sigma\n"
                "L'approche Lean Six Sigma\n"
                "Synergie et complémentarité des deux méthodologies\n"
                "Gestion de projet et résolution de problèmes\n"
                "Définition et suivi des objectifs (SMART)\n"
                "Gestion des risques et des ressources\n"
                "Techniques de résolution de problèmes (A3, 8D, Ishikawa, etc.)\n"
                "Mise en œuvre des améliorations et suivi des résultats\n"
                "Planification et déploiement des actions d'amélioration\n"
                "Mesure des résultats et ajustements\n"
                "Pérennisation des améliorations et gestion du changement\n"
                "Étude de cas et réalisation d'un projet Lean Six Sigma en groupe\n"
                "Bilan de la formation et évaluation des compétences acquises\n",
            dureeData: "10h sur 2j \n"
                "Vendredi 19h00 - 21h00\n"
                "Samedi 10h00 -14h00\n",
            lieuData: "À distance. ",
            tarifData: "2 500 dh / personne TTC\n"
                "15 personnes minimum",
            coutData: "Intervenant : 6 000 dh\n"
                "Salle de formation : 15 000 dh\n"
                "Administration : 20 000 dh\n",
            cvAnimateur: "------",
            contactData:
                "Pour savoir comment s’inscrire; Veuillez nous contacter au :\n"
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
          const TextSectionTitle(title: "Pack Gestion projet (PMI)"),
          const SizedBox(height: 20),
          ..._buildTextSection(
            name: "Gestion projet PMI",
            whyData:
                "Project Management Professional (PMP) est la référence en matière de certification en gestion de projet. Reconnu et exigé par les organisations du monde entier, le PMP vous permet d’assurer  le rôle de chef de projet, dirigeant et dirigeant des projets et des équipes avec efficacité et efficience.\n"
                "Des outils de gestion de projets informatiques vous seront livrés à la fin de la formation.",
            publicCibleData: "Chefs de projet et managers\n"
                "Membres d'équipes de projet\n"
                "Consultants en gestion de projet\n"
                "Professionnels souhaitant obtenir la certification PMP\n",
            objectifsPedagogiqueData:
                "Comprendre les principes fondamentaux de la gestion de projet (PMI)\n"
                "Maîtriser les domaines de connaissances et les groupes de processus du PMI\n"
                "Planifier, exécuter et clôturer des projets avec succès\n"
                "Développer des compétences en leadership, communication et gestion des risques\n"
                "Se préparer à la certification Project Management Professional (PMP)\n",
            certificationData:
                "Certificat  en Gestion de projet et performance global",
            programData: "Introduction à la gestion de projet et au PMI\n"
                "Les domaines de connaissances du PMI\n"
                "Les groupes de processus du PMI\n"
                "Initiating\n"
                "Planning\n"
                "Executing\n"
                "Monitoring & Controlling\n"
                "Closing\n"
                "Techniques de planification et de suivi de projet\n"
                "Planification des tâches et des ressources\n"
                "Estimation des coûts et du temps\n"
                "Méthodes de suivi (Earned Value Management, indicateurs de performance)\n"
                "Leadership, communication et gestion des parties prenantes\n"
                "Styles de leadership et compétences interpersonnelles\n"
                "Techniques de communication efficaces\n"
                "Identification et gestion des attentes des parties prenantes\n"
                "Gestion des risques et des problèmes\n"
                "Identification et analyse des risques\n"
                "Planification des réponses aux risques\n"
                "Suivi et contrôle des risques\n"
                "Résolution de problèmes et prise de décision\n"
                "Préparation à la certification PMP\n"
                "Exigences et processus de certification\n"
                "Stratégies de préparation à l'examen\n"
                "Exercices et tests pratiques\n"
                "Étude de cas et réalisation d'un projet en groupe\n"
                "Bilan de la formation et évaluation des compétences acquises\n",
            dureeData: "10h sur 2j \n"
                "Vendredi 19h00 - 21h00\n"
                "Samedi 10h00 -14h00\n",
            lieuData: "À distance.",
            tarifData: "1 500 dh / personne TTC\n"
                "15 personnes minimum\n",
            coutData: "Intervenant : 6 000 dh\n"
                "Salle de formation : 10 000 dh\n"
                "Administration : 15 000 dh\n",
            cvAnimateur: "-------",
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
          const TextSectionTitle(title: "Pack Optimisation des process"),
          const SizedBox(height: 20),
          ..._buildTextSection(
            name: "optimisation des processus",
            whyData:
                "Une formation opérationnelle détaillant la méthodologie et les outils de l'approche par processus;\n"
                "Des études de cas et des mises en situation pour s'approprier et utiliser efficacement les outils sont offertes;\n"
                "Un plan d'action personnalisé pour une mise en œuvre immédiate de retour en entreprise\n"
                "Questionnaire adressé aux participants 15 jours avant la formation pour connaître leurs attentes;\n"
                "Méthodes pédagogiques : apports théoriques et pratiques (cas concrets, exemples d'application) \n",
            publicCibleData:
                "Managers, responsables de service, responsables de centre de profit, directeurs de projet, chargés de mission organisation.",
            objectifsPedagogiqueData:
                "Identifier et partager le fonctionnement de ses processus pour plus d’efficacité.\n"
                "Fiabiliser et optimiser ses processus à partir de solutions concrètes.\n"
                "Définir des indicateurs de performance pertinents et construire un tableau de bord adapté à sa stratégie.\n"
                "Assurer un pilotage efficace pour atteindre ses objectifs.\n",
            certificationData:
                "Certification en Management et Optimisation des processus.",
            programData: "VISUALISER ET CLARIFIER SES PROCESSUS\ne"
                "L’approche processus\ne"
                "Les techniques de visualisation synthétique\ne"
                "ORIENTER ET FIABILISER SES PROCESSUS\ne"
                "La définition d’un plan de route\ne"
                "La maîtrise opérationnelle\ne"
                "SURVEILLER LE FONCTIONNEMENT ET MESURER LES RÉSULTATS\ne"
                "La détermination des indicateurs pertinents\ne"
                "La construction d’un tableau de bord de pilotage\ne"
                "PILOTER ET OPTIMISER LA PERFORMANCE\ne"
                "Le pilotage et l’animation\ne"
                "L’analyse et l’optimisation\ne",
            dureeData: "10h sur 2j \n"
                "Vendredi 19h00 - 21h00\n"
                "Samedi 10h00 -14h00\n",
            lieuData: "À distance.",
            tarifData: "1 500 dh / personne TTC\n"
                "15 personnes minimum\n",
            coutData: "Intervenant : 6 000 dh\n"
                "Salle de formation : 10 000 dh\n"
                "Administration : 15 000 dh\n",
            cvAnimateur: "---------",
            contactData:
                "Pour savoir comment s’inscrire; Veuillez nous contacter au : \n"
                "06 41 86 59 12\n"
                "06 41 58 85 05\n",
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
        TextSectionTitle(title: "Pourquoi se former en $name ?"),
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
