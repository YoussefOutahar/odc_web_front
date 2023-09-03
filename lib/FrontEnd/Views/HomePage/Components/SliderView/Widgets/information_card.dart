import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc/Services/constants.dart';

import '../../../../../../DataBase/Models/events.dart';
import '../../../../../../Services/Utils/responsive.dart';
import 'info_images.dart';

class InformationCardTile extends StatefulWidget {
  final Event data;
  const InformationCardTile({Key? key, required this.data}) : super(key: key);

  @override
  State<InformationCardTile> createState() => _InformationCardTileState();
}

class _InformationCardTileState extends State<InformationCardTile> {
  bool linkHover = false;
  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context) || Responsive.isTablet(context)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: SizedBox(
                  width: 400,
                  height: 400,
                  child: InfoImages(
                    imagesUrl: 'assets/images/OpenSourceImages/img3.png',
                  ),
                ),
                //  Image.asset(
                //   "assets/images/OpenSourceImages/img3.png",
                //   fit: BoxFit.fill,
                //   scale: 0.7,
                //   filterQuality: FilterQuality.high,
                // ),
                //     GridView.custom(
                //   gridDelegate: SliverStairedGridDelegate(
                //     crossAxisSpacing: 40,
                //     mainAxisSpacing: 30,
                //     startCrossAxisDirectionReversed: true,
                //     pattern: [
                //       const StairedGridTile(0.5, 1),
                //       const StairedGridTile(0.5, 1),
                //       const StairedGridTile(0.5, 1),
                //     ],
                //   ),
                //   childrenDelegate: SliverChildBuilderDelegate(
                //     (context, i) => SizedBox(
                //       width: 100,
                //       height: 100,
                //       child: InfoImages(imagesUrl: widget.data.image),
                //     ),
                //     childCount: 3,
                //   ),
                // ),
              ),
              const SizedBox(width: kDefaultPadding * 2),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    // Text(
                    //   widget.data.name,
                    //   style: const TextStyle(
                    //     color: Colors.white,
                    //     height: 1.3,
                    //     fontSize: 18,
                    //     wordSpacing: 1.2,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    //   overflow: TextOverflow.fade,
                    // ),
                    Text(
                      widget.data.name,
                      style: const TextStyle(
                        fontSize: 20,
                        wordSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      widget.data.date.toDate().toString(),
                      overflow: TextOverflow.fade,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.data.description,
                      overflow: TextOverflow.fade,
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: MouseRegion(
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
                            // UrlLaunch.launchInBrowser(
                            //     url: 'https://${widget.data.sourceUrl}');
                            Get.toNamed('/event/${widget.data.uid}');
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
                              border:
                                  Border.all(color: Colors.white, width: 0.5),
                            ),
                            child: const Text(
                              "Learn More",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Center(
                child: SizedBox(
                  width: 300,
                  height: 200,
                  child: InfoImages(
                    imagesUrl: 'assets/images/OpenSourceImages/img3.png',
                  ),
                ),
                //  Image.asset(
                //   "assets/images/OpenSourceImages/img3.png",
                //   fit: BoxFit.fill,
                //   scale: 0.7,
                //   filterQuality: FilterQuality.high,
                // ),
                //     GridView.custom(
                //   gridDelegate: SliverStairedGridDelegate(
                //     crossAxisSpacing: 40,
                //     mainAxisSpacing: 30,
                //     startCrossAxisDirectionReversed: true,
                //     pattern: [
                //       const StairedGridTile(0.5, 1),
                //       const StairedGridTile(0.5, 1),
                //       const StairedGridTile(0.5, 1),
                //     ],
                //   ),
                //   childrenDelegate: SliverChildBuilderDelegate(
                //     (context, i) => SizedBox(
                //       width: 100,
                //       height: 100,
                //       child: InfoImages(imagesUrl: widget.data.image),
                //     ),
                //     childCount: 3,
                //   ),
                // ),
              ),
              const SizedBox(height: kDefaultPadding),
              // Text(
              //   widget.data.name,
              //   style: const TextStyle(
              //     color: Colors.white,
              //     height: 1.3,
              //     fontSize: 18,
              //     wordSpacing: 1.2,
              //     fontWeight: FontWeight.w600,
              //   ),
              //   overflow: TextOverflow.fade,
              // ),
              Text(
                widget.data.name,
                style: const TextStyle(
                  fontSize: 20,
                  wordSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.fade,
              ),
              const SizedBox(height: 40),
              Text(
                widget.data.date.toDate().toString(),
                overflow: TextOverflow.fade,
              ),
              const SizedBox(height: 20),
              Text(
                widget.data.description,
                overflow: TextOverflow.fade,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: MouseRegion(
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
                      // UrlLaunch.launchInBrowser(
                      //     url: 'https://${widget.data.sourceUrl}');
                      Get.toNamed('/event/${widget.data.uid}');
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
                      child: const Text(
                        "Learn More",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
  }
}