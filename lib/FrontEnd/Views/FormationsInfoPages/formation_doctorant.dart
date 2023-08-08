import 'package:flutter/material.dart';
import 'package:odc/Services/constants.dart';

import '../../../DataBase/Models/formations.dart';
import 'Components/data_grid.dart';
import '../../Components/page_header.dart';
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
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.translate(
          offset: const Offset(0, -kToolbarHeight * 1.2),
          child: PageHeader(
            imgSrc: formation.image,
            title: formation.title,
            size: size,
            subTitle: '',
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
                child: Text(
                  formationsKeys[0],
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Tab(
                child: Text(
                  formationsKeys[1],
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Tab(
                child: Text(
                  formationsKeys[2],
                  overflow: TextOverflow.ellipsis,
                ),
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
  }
}
