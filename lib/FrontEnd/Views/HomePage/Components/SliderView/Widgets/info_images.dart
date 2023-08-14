import 'package:flutter/material.dart';

import '../../../../../../Services/Utils/url_launch.dart';
import '../information_model.dart';

class InfoImages extends StatefulWidget {
  final ListOfImages imagesData;
  const InfoImages({Key? key, required this.imagesData}) : super(key: key);

  @override
  State<InfoImages> createState() => _InfoImagesState();
}

class _InfoImagesState extends State<InfoImages> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: InkWell(
        onTap: () {
          UrlLaunch.launchInBrowser(url: widget.imagesData.imageUrl.toString());
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.imagesData.imageUrl.toString(),
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(
                  horizontal: isHover ? 12 : 10, vertical: isHover ? 7 : 5),
              decoration: BoxDecoration(
                color: isHover
                    ? Colors.black.withOpacity(0.3)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: isHover
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.imagesData.source.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Icon(
                          Icons.ads_click,
                          color: Colors.white,
                          size: 15,
                        )
                      ],
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
