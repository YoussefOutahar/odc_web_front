import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:odc/Services/constants.dart';

import '../../../../../../Services/Utils/url_launch.dart';
import '../information_model.dart';
import 'info_images.dart';

class InformationCardTile extends StatefulWidget {
  final InformationModel data;
  const InformationCardTile({Key? key, required this.data}) : super(key: key);

  @override
  State<InformationCardTile> createState() => _InformationCardTileState();
}

class _InformationCardTileState extends State<InformationCardTile> {
  bool linkHover = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                widget.data.title.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  height: 1.3,
                  fontSize: 18,
                  wordSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.fade,
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    'Lear More:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        linkHover = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        linkHover = false;
                      });
                    },
                    child: InkWell(
                      onTap: () {
                        UrlLaunch.launchInBrowser(
                            url: 'https://${widget.data.sourceUrl}');
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                            horizontal: linkHover ? 12 : 10,
                            vertical: linkHover ? 7 : 5),
                        decoration: BoxDecoration(
                          color: linkHover
                              ? Colors.black.withOpacity(0.5)
                              : Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white, width: 0.5),
                        ),
                        child: Text(
                          widget.data.sourceUrl.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: kDefaultPadding),
        Expanded(
          child: Center(
            child: GridView.custom(
              gridDelegate: SliverStairedGridDelegate(
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                startCrossAxisDirectionReversed: true,
                pattern: [
                  const StairedGridTile(0.5, 1),
                  const StairedGridTile(0.5, 1),
                  const StairedGridTile(0.5, 1),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                  (context, i) =>
                      InfoImages(imagesData: widget.data.imagesData![i]),
                  childCount: widget.data.imagesData!.length),
            ),
          ),
        )
      ],
    );
  }
}
