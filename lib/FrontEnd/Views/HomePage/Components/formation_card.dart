import 'package:flutter/material.dart';

import '../../../../DataBase/Models/formations.dart';
import '../../../../Services/Utils/responsive.dart';

class FormationCard extends StatefulWidget {
  // just press "Command + ."
  const FormationCard({
    Key? key,
    required this.index,
    required this.press,
  }) : super(key: key);

  final int index;
  final VoidCallback press;

  @override
  State<FormationCard> createState() => _FormationCardState();
}

class _FormationCardState extends State<FormationCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: Responsive.isMobile(context) ? size.height / 3 : 320,
        width: Responsive.isMobile(context) ? size.width * 0.8 : 540,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (isHover)
              BoxShadow(
                offset: const Offset(0, 20),
                blurRadius: 50,
                color: Colors.black.withOpacity(0.1),
              )
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              height: Responsive.isMobile(context) ? size.height / 3 : 320,
              width: Responsive.isMobile(context) ? size.width * 0.4 : 270,
              child: Image.asset(formations[widget.index].image,
                  fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(formations[widget.index].category.toUpperCase()),
                    const SizedBox(height: 20 / 2),
                    Text(formations[widget.index].title,
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 20),
                    const Text(
                      "View Details",
                      style: TextStyle(decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
