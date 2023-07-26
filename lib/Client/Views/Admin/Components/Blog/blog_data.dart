import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lottie/lottie.dart';

import '../../../../../DataBase/Controllers/blog_controller.dart';
import '../../../../../DataBase/Models/blog_post.dart';
import '../Shared/loading_animation.dart';

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
    return IgnorePointer(
      ignoring: _isLoading,
      child: Stack(
        children: [
          Positioned.fill(
              child: SingleChildScrollView(
            child: Padding(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 8,
                      // color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: contentController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            // labelText: "Content",
                            hintText: "Edit your blog markdown here",
                          ),
                          onChanged: (text) => setState(() {}),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 8,
                    // color: Theme.of(context).primaryColor,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: size.height * 0.3,
                        child: MarkdownBody(
                          data: contentController.text,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
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
                      setState(() {
                        _isLoading = true;
                      });
                      await _upload();
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: const Text('Done'),
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(child: _buildUploadProgress()),
        ],
      ),
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
          Positioned.fill(
            child: InkWell(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: [
                    'jpg',
                    'jpeg',
                    'png',
                    'bmp',
                    'gif',
                  ],
                );
                if (result != null) {
                  fileName = result.files.single.name;
                  data = result.files.single.bytes!;
                  setState(() {
                    fileUploaded = true;
                  });
                }
              },
            ),
          )
        ],
      );

  bool _isLoading = false;
  Widget _buildUploadProgress() {
    if (_isLoading) {
      return Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: uploadTask != null
              ? LoadingAnimation(
                  uploadTask: uploadTask!,
                )
              : const SizedBox(),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  _upload() async {
    if (widget.blogPost.title.isEmpty || widget.blogPost.content.isEmpty) {
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
          final String path = 'files/blog/${newBlogPost.uid}/$fileName';
          final Reference ref = FirebaseStorage.instance.ref(path);
          setState(() {
            uploadTask = ref.putData(data);
          });
          await uploadTask!.whenComplete(() {
            setState(() {
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
        final String path = 'files/blog/${widget.blogPost.uid}/$fileName';

        debugPrint(path);
        final Reference ref = FirebaseStorage.instance.ref(path);
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
            uploadTask = null;
          });
        });
        setState(() {});
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
