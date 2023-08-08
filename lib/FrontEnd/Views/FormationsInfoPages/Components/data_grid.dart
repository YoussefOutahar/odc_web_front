import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:odc/FrontEnd/Views/FormationsInfoPages/Components/Text/text_card.dart';
import 'package:odc/FrontEnd/Views/FormationsInfoPages/Components/Text/text_section_text.dart';
import 'package:odc/FrontEnd/Views/FormationsInfoPages/Components/Text/text_section_title.dart';
import 'package:odc/Services/constants.dart';

import '../../../../Services/Utils/responsive.dart';
import 'Text/expandables_list.dart';
import 'Text/folded_text_card.dart';
import 'Text/side_text_card.dart';

class DataGrid extends StatelessWidget {
  const DataGrid({
    super.key,
    required this.name,
    required this.whyData,
    required this.publicCibleData,
    required this.objectifsPedagogiqueData,
    required this.certificationData,
    required this.programData,
    required this.dureeData,
    required this.lieuData,
    required this.tarifData,
    required this.coutData,
    required this.cvAnimateur,
    required this.contactData,
  });

  final String name;
  final String whyData;
  final String publicCibleData;
  final String objectifsPedagogiqueData;
  final String certificationData;
  final String programData;
  final String dureeData;
  final String lieuData;
  final String tarifData;
  final String coutData;
  final String cvAnimateur;
  final String contactData;

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context) ? _buildDesktop() : _buildMobile();
  }

  Widget _buildDesktop() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextCard(
                        title: "Pourquoi se former en $name ?", text: whyData),
                    TextCard(
                        title: "Objectifs pédagogique :",
                        text: objectifsPedagogiqueData),
                    TextCard(title: "Public Cible :", text: publicCibleData),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: kDefaultPadding,
                    left: kDefaultPadding,
                  ),
                  child: Column(
                    children: [
                      SideTextCard(
                        title: "Durée :",
                        text: dureeData,
                        icon: Icons.timer,
                      ),
                      SideTextCard(
                        title: "Tarif :",
                        text: tarifData,
                        icon: Icons.attach_money,
                      ),
                      SideTextCard(
                        title: "Lieu :",
                        text: lieuData,
                        icon: Icons.location_on,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding),
          FoldedTextCard(title: "Programme :", text: programData),
          const SizedBox(height: kDefaultPadding),
          ExpandablesList(
            data: {
              "Certification :": certificationData,
              "Coût :": coutData,
              "Animateur :": cvAnimateur,
            },
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SideTextCard(
          //       title: "Certification :",
          //       text: certificationData,
          //       icon: Icons.check_circle,
          //     ),
          //     SideTextCard(
          //       title: "Coût :",
          //       text: coutData,
          //       icon: Icons.attach_money,
          //     ),
          //     const SizedBox(width: kDefaultPadding),
          //     SideTextCard(
          //       title: "Animateur :",
          //       text: cvAnimateur,
          //       icon: Icons.person,
          //     ),
          //   ],
          // ),
          const SizedBox(height: kDefaultPadding),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                const TextSectionTitle(title: "Contactez nous sur :"),
                TextSectionText(text: contactData)
              ],
            ),
          ),
        ],
      );

  Widget _buildMobile() => Column(
        children: [
          TextCard(title: "Pourquoi se former en $name ?", text: whyData),
          TextCard(
              title: "Objectifs pédagogique :", text: objectifsPedagogiqueData),
          TextCard(title: "Public Cible :", text: publicCibleData),
          const SizedBox(height: kDefaultPadding),
          MasonryGridView(
            addRepaintBoundaries: false,
            clipBehavior: Clip.antiAlias,
            shrinkWrap: true,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: [
              SideTextCard(
                title: "Durée :",
                text: dureeData,
                icon: Icons.timer,
              ),
              SideTextCard(
                title: "Tarif :",
                text: tarifData,
                icon: Icons.attach_money,
              ),
              SideTextCard(
                title: "Lieu :",
                text: lieuData,
                icon: Icons.location_on,
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding * 2),
          FoldedTextCard(title: "Programme :", text: programData),
          const SizedBox(height: kDefaultPadding * 2),
          ExpandablesList(
            data: {
              "Certification :": certificationData,
              "Coût :": coutData,
              "Animateur :": cvAnimateur,
            },
          ),
          // SideTextCard(
          //   title: "Certification :",
          //   text: certificationData,
          //   icon: Icons.check_circle,
          // ),
          // SideTextCard(
          //   title: "Coût :",
          //   text: coutData,
          //   icon: Icons.attach_money,
          // ),
          // const SizedBox(height: kDefaultPadding),
          // SideTextCard(
          //   title: "Animateur :",
          //   text: cvAnimateur,
          //   icon: Icons.person,
          // ),
          const SizedBox(height: kDefaultPadding * 2),
          TextCard(title: "Contactez nous sur :", text: contactData),
        ],
      );
}
