import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../DataBase/Models/formations.dart';
import '../../../Services/constants.dart';
import 'Components/data_grid.dart';
import '../../Components/page_header.dart';
import 'data.dart';

class FormationSurMesuresInfoPage extends StatefulWidget {
  const FormationSurMesuresInfoPage({super.key});

  @override
  State<FormationSurMesuresInfoPage> createState() => _FormationSurMesuresInfoPageState();
}

class _FormationSurMesuresInfoPageState extends State<FormationSurMesuresInfoPage> with SingleTickerProviderStateMixin {
  late Formation formation;

  late TabController _tabController;

  List<String> formationsKeys = [
    "Pack E-commerce",
    "Pack Lean Management & Six Sigma",
    "Pack Gestion projet (PMI)",
    "Pack Optimisation des process"
  ];
  @override
  void initState() {
    formation = formations[0];
    _tabController = TabController(length: 3, vsync: this);
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
          child: Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              // add it here
              indicator: RectangularIndicator(
                paintingStyle: PaintingStyle.stroke,
                bottomLeftRadius: 10,
                bottomRightRadius: 10,
                topLeftRadius: 10,
                topRightRadius: 10,
              ),
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
        ),
        Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: DataGrid(
                name: FormationData.formationSurMesuresData[formationsKeys[_tabController.index]]!["name"],
                whyData: FormationData.formationSurMesuresData[formationsKeys[_tabController.index]]!["whyData"],
                publicCibleData:
                    FormationData.formationSurMesuresData[formationsKeys[_tabController.index]]!["publicCibleData"],
                objectifsPedagogiqueData: FormationData
                    .formationSurMesuresData[formationsKeys[_tabController.index]]!["objectifsPedagogiqueData"],
                certificationData:
                    FormationData.formationSurMesuresData[formationsKeys[_tabController.index]]!["certificationData"],
                programData:
                    FormationData.formationSurMesuresData[formationsKeys[_tabController.index]]!["programData"],
                cvAnimateur:
                    FormationData.formationSurMesuresData[formationsKeys[_tabController.index]]!["cvAnimateur"],
                dureeData: FormationData.formationSurMesuresData[formationsKeys[_tabController.index]]!["dureeData"],
                lieuData: FormationData.formationSurMesuresData[formationsKeys[_tabController.index]]!["lieuData"],
                tarifData: FormationData.formationSurMesuresData[formationsKeys[_tabController.index]]!["tarifData"],
                coutData: FormationData.formationSurMesuresData[formationsKeys[_tabController.index]]!["coutData"],
                contactData:
                    FormationData.formationSurMesuresData[formationsKeys[_tabController.index]]!["contactData"],
              ),
            );
          },
        ),
      ],
    );
  }

  // Widget _buildExplanationImage(BuildContext context, Size size) =>
  //     Responsive.isMobile(context)
  //         ? Align(
  //             alignment: Alignment.center,
  //             child: Image.asset(
  //               "assets/images/formations/sur_mesures.png",
  //               width: size.width / 2,
  //               height: size.height / 2,
  //             ),
  //           )
  //         : const SizedBox.shrink();
}
