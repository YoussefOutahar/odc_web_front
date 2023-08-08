import 'package:flutter/material.dart';

import '../../../DataBase/Models/formations.dart';
import '../../../Services/constants.dart';
import 'Components/data_grid.dart';
import '../../Components/page_header.dart';
import 'data.dart';

class FormationSoftSkillsInfoPage extends StatefulWidget {
  const FormationSoftSkillsInfoPage({super.key});

  @override
  State<FormationSoftSkillsInfoPage> createState() =>
      _FormationSoftSkillsInfoPageState();
}

class _FormationSoftSkillsInfoPageState
    extends State<FormationSoftSkillsInfoPage>
    with SingleTickerProviderStateMixin {
  late Formation formation;

  late TabController _tabController;

  List<String> formationsKeys = [
    "Pack Certificat PNL",
    "Pack Innovation & Business",
    "Pack Santé sociale et bien être",
    "Pack Prise de décision"
  ];

  @override
  void initState() {
    formation = formations[1];
    _tabController = TabController(length: 4, vsync: this);
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
              Tab(
                child: Text(
                  formationsKeys[3],
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
                name: FormationData.formationSoftSkillsData[
                    formationsKeys[_tabController.index]]!["name"],
                whyData: FormationData.formationSoftSkillsData[
                    formationsKeys[_tabController.index]]!["whyData"],
                publicCibleData: FormationData.formationSoftSkillsData[
                    formationsKeys[_tabController.index]]!["publicCibleData"],
                objectifsPedagogiqueData: FormationData.formationSoftSkillsData[
                        formationsKeys[_tabController.index]]![
                    "objectifsPedagogiqueData"],
                certificationData: FormationData.formationSoftSkillsData[
                    formationsKeys[_tabController.index]]!["certificationData"],
                programData: FormationData.formationSoftSkillsData[
                    formationsKeys[_tabController.index]]!["programData"],
                cvAnimateur: FormationData.formationSoftSkillsData[
                    formationsKeys[_tabController.index]]!["cvAnimateur"],
                dureeData: FormationData.formationSoftSkillsData[
                    formationsKeys[_tabController.index]]!["dureeData"],
                lieuData: FormationData.formationSoftSkillsData[
                    formationsKeys[_tabController.index]]!["lieuData"],
                tarifData: FormationData.formationSoftSkillsData[
                    formationsKeys[_tabController.index]]!["tarifData"],
                coutData: FormationData.formationSoftSkillsData[
                    formationsKeys[_tabController.index]]!["coutData"],
                contactData: FormationData.formationSoftSkillsData[
                    formationsKeys[_tabController.index]]!["contactData"],
              ),
            );
          },
        ),
      ],
    );
  }
}
