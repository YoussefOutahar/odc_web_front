import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:lottie/lottie.dart';

import '../../../../DataBase/Controllers/blog_controller.dart';
import '../../../../DataBase/Models/blog_post.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  Widget? currentView;

  @override
  void initState() {
    currentView = _buildBlogListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentView ?? const Center(child: CircularProgressIndicator());
  }

  Widget _buildBlogListView() => StreamBuilder<List<BlogPost>>(
        stream: BlogController.getBlogPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    for (int i = 0; i < snapshot.data!.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlogPostCard(blogPost: snapshot.data![i]),
                      ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        currentView = _buildAddBlogView();
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );

  Widget _buildAddBlogView() => Stack(
        children: [
          BlogData(
            blogPost: BlogPost(
              uid: '',
              title: '',
              content: '',
              image: '',
              createdAt: Timestamp.now(),
            ),
            onCanceled: () => setState(() {
              currentView = _buildBlogListView();
            }),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentView = _buildBlogListView();
                  });
                },
              ),
            ),
          ),
        ],
      );

  Widget _buildEditBlogView(BlogPost blogPost) => Stack(
        children: [
          BlogData(
            blogPost: blogPost,
            onCanceled: () => setState(() {
              currentView = _buildBlogListView();
            }),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentView = _buildBlogListView();
                  });
                },
              ),
            ),
          ),
        ],
      );
}

class BlogData extends StatefulWidget {
  const BlogData({super.key, required this.blogPost, required this.onCanceled});

  final BlogPost blogPost;
  final VoidCallback onCanceled;

  @override
  State<BlogData> createState() => _BlogDataState();
}

class _BlogDataState extends State<BlogData> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  late DropzoneViewController dropZoneController;
  UploadTask? uploadTask;
  double progress = 0;
  bool _startAnimation = false;

  bool fileUploaded = false;
  String fileName = '';
  Uint8List data = Uint8List(0);

  @override
  void initState() {
    titleController.text = widget.blogPost.title;
    contentController.text = widget.blogPost.content;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 40, right: 40),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.3,
                width: size.width * 0.3,
                child: fileUploaded
                    ? Column(
                        children: [
                          SizedBox(
                              height: size.height * 0.2,
                              width: size.width * 0.2,
                              child: Image.memory(data)),
                          Text(fileName),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                fileUploaded = false;
                              });
                            },
                            icon: const Icon(Icons.restart_alt_outlined),
                          ),
                        ],
                      )
                    : _buildDropZone(),
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
              ),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: "Content",
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: widget.onCanceled,
                  child: const Text('Cancel'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (widget.blogPost.title.isEmpty ||
                        widget.blogPost.content.isEmpty) {
                      BlogPost? newBlogPost = await BlogController.addBlogPost(
                        BlogPost(
                          title: titleController.text,
                          content: contentController.text,
                          createdAt: Timestamp.now(),
                          image: "",
                        ),
                      );

                      if (newBlogPost != null) {
                        try {
                          final String path =
                              'files/blog/${newBlogPost.uid}/$fileName';
                          final Reference ref =
                              FirebaseStorage.instance.ref(path);
                          setState(() {
                            uploadTask = ref.putData(data);
                          });
                          await uploadTask!.whenComplete(() {
                            setState(() {
                              progress = 0;
                              uploadTask = null;
                            });
                          });
                          await BlogController.updateBlogPost(
                            BlogPost(
                              uid: newBlogPost.uid,
                              title: titleController.text,
                              content: contentController.text,
                              image: path,
                              createdAt: Timestamp.now(),
                            ),
                          );
                          setState(() {});
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      } else {
                        debugPrint('Error');
                      }
                    } else {
                      try {
                        final String path =
                            'files/blog/${widget.blogPost.uid}/$fileName';

                        debugPrint(path);
                        final Reference ref =
                            FirebaseStorage.instance.ref(path);
                        await BlogController.updateBlogPost(
                          BlogPost(
                            uid: widget.blogPost.uid,
                            title: titleController.text,
                            content: contentController.text,
                            image: path,
                            createdAt: Timestamp.now(),
                          ),
                        );

                        setState(() {
                          uploadTask = ref.putData(data);
                        });
                        await uploadTask!.whenComplete(() {
                          setState(() {
                            progress = 0;
                            uploadTask = null;
                          });
                        });
                        setState(() {});
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    }
                  },
                  child: const Text('Done'),
                ),
              )
            ],
          ),
        ),
        _buildUploadProgress(),
      ],
    );
  }

  Widget _buildDropZone() => Stack(
        children: [
          DottedBorder(
            color: Colors.black,
            strokeWidth: 2,
            dashPattern: const [10, 10],
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            child: DropzoneView(
              operation: DragOperation.copy,
              cursor: CursorType.grab,
              onCreated: (DropzoneViewController controller) {
                dropZoneController = controller;
              },
              mime: const [
                'image/jpeg',
                'image/png',
                'image/bmp',
                'image/gif',
                'image/jpg',
              ],
              onHover: () => setState(() {
                _startAnimation = true;
              }),
              onLeave: () => setState(() {
                _startAnimation = false;
              }),
              onDrop: (value) async {
                fileName = await dropZoneController.getFilename(value);
                data = await dropZoneController.getFileData(value);
                setState(() {
                  fileUploaded = true;
                });
              },
            ),
          ),
          Center(
            child: Lottie.asset(
              'assets/animations/download-file-icon-animation.json',
              frameRate: FrameRate.max,
              repeat: _startAnimation,
            ),
          ),
        ],
      );

  Widget _buildUploadProgress() {
    if (uploadTask != null) {
      return Center(
        child: StreamBuilder(
          stream: uploadTask?.snapshotEvents,
          builder:
              (BuildContext context, AsyncSnapshot<TaskSnapshot> snapshot) {
            if (snapshot.hasData) {
              progress =
                  snapshot.data!.bytesTransferred / snapshot.data!.totalBytes;
              return SizedBox(
                  height: 120,
                  width: 100,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            backgroundColor: Colors.grey,
                            value: progress,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${(progress * 100).toStringAsFixed(2)} %",
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ));
            } else if (snapshot.hasError) {
              return const Text("Error");
            } else {
              return const SizedBox();
            }
          },
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

class BlogPostCard extends StatefulWidget {
  const BlogPostCard({super.key, required this.blogPost});

  final BlogPost blogPost;

  @override
  State<BlogPostCard> createState() => _BlogPostCardState();
}

class _BlogPostCardState extends State<BlogPostCard> {
  bool isHover = false;
  Duration duration = const Duration(milliseconds: 200);

  String? imageUrl;

  @override
  void initState() {
    loadImageUrl();
    super.initState();
  }

  Future<void> loadImageUrl() async {
    String downloadUrl = await FirebaseStorage.instance
        .ref(widget.blogPost.image)
        .getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        duration: duration,
        height: 400,
        width: 300,
        decoration: BoxDecoration(
          boxShadow: [
            if (isHover)
              BoxShadow(
                offset: const Offset(0, 20),
                blurRadius: 50,
                color: Colors.black.withOpacity(0.1),
              )
          ],
        ),
        child: Card(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imageUrl != null
                        ? SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const CircularProgressIndicator(),
                    const SizedBox(height: 60),
                    Text(
                      widget.blogPost.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text.rich(
                    TextSpan(
                      text: "Know more about ",
                      children: [
                        TextSpan(
                          text: "me",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
