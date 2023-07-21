import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:odc/FrontEnd/Views/FormationsInfoPages/Components/text_card.dart';

import '../../../../Services/Utils/responsive.dart';

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
    List<Widget> textdata = [
      TextCard(title: "Pourquoi se former en $name ?", text: whyData),
      TextCard(title: "Public Cible :", text: publicCibleData),
      TextCard(
          title: "Objectifs pédagogique :", text: objectifsPedagogiqueData),
      TextCard(title: "Certification :", text: certificationData),
      TextCard(title: "Programme :", text: programData),
      TextCard(title: "Durée :", text: dureeData),
      TextCard(title: "Lieu :", text: lieuData),
      TextCard(title: "Tarif :", text: tarifData),
      TextCard(title: "Coût :", text: coutData),
      TextCard(title: "Animateur :", text: cvAnimateur),
      TextCard(title: "Contacter nous sure :", text: contactData),
    ];
    return MasonryGridView.count(
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      shrinkWrap: true,
      crossAxisCount: Responsive.isMobile(context)
          ? 1
          : Responsive.isTablet(context)
              ? 2
              : 3,
      itemCount: textdata.length,
      itemBuilder: (context, index) {
        return Center(
          child: textdata[index],
        );
      },
    );
  }
}
