import 'package:flutter/material.dart';
import 'package:odc/Services/constants.dart';

import '../../../DataBase/Models/formations.dart';
import 'Components/data_grid.dart';
import 'Components/formation_header.dart';
import 'data.dart';

class FormationDoctorantInfoPage extends StatefulWidget {
  const FormationDoctorantInfoPage({super.key});

  @override
  State<FormationDoctorantInfoPage> createState() =>
      _FormationDoctorantInfoPageState();
}

class _FormationDoctorantInfoPageState extends State<FormationDoctorantInfoPage>
    with TickerProviderStateMixin {
  late Formation formation;

  late TabController _tabController;

  List<String> formationsKeys = [
    "Boîte à outils recherche scientifique",
    "Boîte à outils Méthodologie & encadrement",
    "Boîte à outils Enseignement supérieur et pédagogie"
  ];

  @override
  void initState() {
    formation = formations[2];
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Transform.translate(
          offset: const Offset(0, -kToolbarHeight * 0.5),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            onTap: (index) => setState(() {}),
            tabs: [
              Tab(
                text: formationsKeys[0],
              ),
              Tab(
                text: formationsKeys[1],
              ),
              Tab(
                text: formationsKeys[2],
              ),
            ],
          ),
        ),
        Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: DataGrid(
                name: FormationData.formationDoctorantData[
                    formationsKeys[_tabController.index]]!["name"],
                whyData: FormationData.formationDoctorantData[
                    formationsKeys[_tabController.index]]!["whyData"],
                publicCibleData: FormationData.formationDoctorantData[
                    formationsKeys[_tabController.index]]!["publicCibleData"],
                objectifsPedagogiqueData: FormationData.formationDoctorantData[
                        formationsKeys[_tabController.index]]![
                    "objectifsPedagogiqueData"],
                certificationData: FormationData.formationDoctorantData[
                    formationsKeys[_tabController.index]]!["certificationData"],
                programData: FormationData.formationDoctorantData[
                    formationsKeys[_tabController.index]]!["programData"],
                cvAnimateur: FormationData.formationDoctorantData[
                    formationsKeys[_tabController.index]]!["cvAnimateur"],
                dureeData: FormationData.formationDoctorantData[
                    formationsKeys[_tabController.index]]!["dureeData"],
                lieuData: FormationData.formationDoctorantData[
                    formationsKeys[_tabController.index]]!["lieuData"],
                tarifData: FormationData.formationDoctorantData[
                    formationsKeys[_tabController.index]]!["tarifData"],
                coutData: FormationData.formationDoctorantData[
                    formationsKeys[_tabController.index]]!["coutData"],
                contactData: FormationData.formationDoctorantData[
                    formationsKeys[_tabController.index]]!["contactData"],
              ),
            );
          },
        ),
      ],
    );
    // return _buildPage(size);
  }

  // Widget _buildPage(Size size) => Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Transform.translate(
  //           offset: const Offset(0, -kToolbarHeight * 1.2),
  //           child: FormationHeader(
  //             imgSrc: formation.image,
  //             title: formation.title,
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //         TextSectionTitle(title: formation1),
  //         const SizedBox(height: 20),
  //         Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: DataGrid(
  //             name: FormationData.formationDoctorantData[formation1]!["name"],
  //             whyData:
  //                 FormationData.formationDoctorantData[formation1]!["whyData"],
  //             publicCibleData: FormationData
  //                 .formationDoctorantData[formation1]!["publicCibleData"],
  //             objectifsPedagogiqueData: FormationData.formationDoctorantData[
  //                 formation1]!["objectifsPedagogiqueData"],
  //             certificationData: FormationData
  //                 .formationDoctorantData[formation1]!["certificationData"],
  //             programData: FormationData
  //                 .formationDoctorantData[formation1]!["programData"],
  //             cvAnimateur: FormationData
  //                 .formationDoctorantData[formation1]!["cvAnimateur"],
  //             dureeData: FormationData
  //                 .formationDoctorantData[formation1]!["dureeData"],
  //             lieuData:
  //                 FormationData.formationDoctorantData[formation1]!["lieuData"],
  //             tarifData: FormationData
  //                 .formationDoctorantData[formation1]!["tarifData"],
  //             coutData:
  //                 FormationData.formationDoctorantData[formation1]!["coutData"],
  //             contactData: FormationData
  //                 .formationDoctorantData[formation1]!["contactData"],
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //         const Divider(
  //           color: Colors.black,
  //           height: 20,
  //           thickness: 2,
  //           indent: 20,
  //           endIndent: 20,
  //         ),
  //         const SizedBox(height: 20),
  //         TextSectionTitle(title: formation2),
  //         const SizedBox(height: 20),
  //         Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: DataGrid(
  //             name: FormationData.formationDoctorantData[formation2]!["name"],
  //             whyData:
  //                 FormationData.formationDoctorantData[formation2]!["whyData"],
  //             publicCibleData: FormationData
  //                 .formationDoctorantData[formation2]!["publicCibleData"],
  //             objectifsPedagogiqueData: FormationData.formationDoctorantData[
  //                 formation2]!["objectifsPedagogiqueData"],
  //             certificationData: FormationData
  //                 .formationDoctorantData[formation2]!["certificationData"],
  //             programData: FormationData
  //                 .formationDoctorantData[formation2]!["programData"],
  //             cvAnimateur: FormationData
  //                 .formationDoctorantData[formation2]!["cvAnimateur"],
  //             dureeData: FormationData
  //                 .formationDoctorantData[formation2]!["dureeData"],
  //             lieuData:
  //                 FormationData.formationDoctorantData[formation2]!["lieuData"],
  //             tarifData: FormationData
  //                 .formationDoctorantData[formation2]!["tarifData"],
  //             coutData:
  //                 FormationData.formationDoctorantData[formation2]!["coutData"],
  //             contactData: FormationData
  //                 .formationDoctorantData[formation2]!["contactData"],
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //         const Divider(
  //           color: Colors.black,
  //           height: 20,
  //           thickness: 2,
  //           indent: 20,
  //           endIndent: 20,
  //         ),
  //         const SizedBox(height: 20),
  //         TextSectionTitle(title: formation3),
  //         const SizedBox(height: 20),
  //         Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: DataGrid(
  //             name: FormationData.formationDoctorantData[formation3]!["name"],
  //             whyData:
  //                 FormationData.formationDoctorantData[formation3]!["whyData"],
  //             publicCibleData: FormationData
  //                 .formationDoctorantData[formation3]!["publicCibleData"],
  //             objectifsPedagogiqueData: FormationData.formationDoctorantData[
  //                 formation3]!["objectifsPedagogiqueData"],
  //             certificationData: FormationData
  //                 .formationDoctorantData[formation3]!["certificationData"],
  //             programData: FormationData
  //                 .formationDoctorantData[formation3]!["programData"],
  //             cvAnimateur: FormationData
  //                 .formationDoctorantData[formation3]!["cvAnimateur"],
  //             dureeData: FormationData
  //                 .formationDoctorantData[formation3]!["dureeData"],
  //             lieuData:
  //                 FormationData.formationDoctorantData[formation3]!["lieuData"],
  //             tarifData: FormationData
  //                 .formationDoctorantData[formation3]!["tarifData"],
  //             coutData:
  //                 FormationData.formationDoctorantData[formation3]!["coutData"],
  //             contactData: FormationData
  //                 .formationDoctorantData[formation3]!["contactData"],
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
}
