import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../DataBase/Models/events.dart';
import '../../../../../../Services/constants.dart';
import 'info_images.dart';

class InformationCardTile extends StatefulWidget {
  final Event data;
  const InformationCardTile({Key? key, required this.data}) : super(key: key);

  @override
  State<InformationCardTile> createState() => _InformationCardTileState();
}

class _InformationCardTileState extends State<InformationCardTile>
    with AutomaticKeepAliveClientMixin<InformationCardTile> {
  bool linkHover = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 314,
              width: 500,
              child: FutureBuilder(
                future: widget.data.getImageDownloadLink,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return InfoImages(
                      imagesUrl: snapshot.data.toString(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: kSecondaryColor,
                    ));
                  }
                },
              ),
            ),
            const SizedBox(height: kDefaultPadding / 2),
            Text(
              widget.data.date.toDate().toString(),
              overflow: TextOverflow.fade,
            ),
          ],
        )
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
        const SizedBox(width: kDefaultPadding * 3),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kDefaultPadding),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       widget.data.organisation,
              //       style: const TextStyle(
              //         fontSize: 15,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       overflow: TextOverflow.fade,
              //     ),
              //     const SizedBox(width: kDefaultPadding / 2),
              //     Text(
              //       widget.data.city,
              //       style: const TextStyle(
              //         fontSize: 15,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       overflow: TextOverflow.fade,
              //     ),
              //   ],
              // ),
              const Divider(
                endIndent: 20,
                indent: 20,
              ),
              const Spacer(),
              Text(
                widget.data.name,
                style: const TextStyle(
                  fontSize: 30,
                  wordSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.fade,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Text(
                widget.data.description,
                overflow: TextOverflow.fade,
              ),
              const Spacer(),
              const Divider(
                endIndent: 20,
                indent: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
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
                      Get.toNamed('/event/${widget.data.uid}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(horizontal: linkHover ? 12 : 10, vertical: linkHover ? 7 : 5),
                        decoration: BoxDecoration(
                          color: linkHover ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        child: const Text(
                          "Learn More",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                          ),
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
