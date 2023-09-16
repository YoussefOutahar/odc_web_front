import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../DataBase/Models/blog_post.dart';
import '../../../../Services/cached_image_service.dart';
import '../../../../Services/constants.dart';
import '../../../../Services/Utils/responsive.dart';
import '../../../../translations/locale_keys.g.dart';

class BlogPostCard extends StatefulWidget {
  final BlogPost blogPost;
  const BlogPostCard({
    Key? key,
    required this.blogPost,
  }) : super(key: key);

  @override
  State<BlogPostCard> createState() => _BlogPostCardState();
}

class _BlogPostCardState extends State<BlogPostCard> {
  late Future<String> imageLinkFuture;

  @override
  void initState() {
    imageLinkFuture = widget.blogPost.getImageDownloadlink;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            FutureBuilder(
              future: imageLinkFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: ImageManager(
                      imageUrl: snapshot.data.toString(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error'),
                  );
                } else {
                  return const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.blogPost.createdAt.toDate().toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      widget.blogPost.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Responsive.isDesktop(context) ? 32 : 24,
                        fontFamily: "Raleway",
                        color: const Color(0xFF191919),
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MarkdownBody(
                      data: widget.blogPost.content,
                      selectable: true,
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed("/blogPost/${widget.blogPost.uid}");
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              bottom: kDefaultPadding / 4),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(color: kPrimaryColor, width: 3),
                            ),
                          ),
                          child: Text(
                            LocaleKeys.blog_page_read_more.tr(),
                            style: const TextStyle(color: Color(0xFF191919)),
                          ),
                        ),
                      ),
                      const Spacer(),
                      // IconButton(
                      //   icon: SvgPicture.asset(
                      //       "assets/icons/feather_thumbs-up.svg"),
                      //   onPressed: () {},
                      // ),
                      // IconButton(
                      //   icon: SvgPicture.asset(
                      //       "assets/icons/feather_message-square.svg"),
                      //   onPressed: () {},
                      // ),
                      IconButton(
                        icon: SvgPicture.asset(
                            "assets/icons/feather_share-2.svg"),
                        onPressed: () {
                          Share.share(
                            "https://https://optimadecision-771ba.web.app/#/home/blogPost/${widget.blogPost.uid}",
                            subject: widget.blogPost.title,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
