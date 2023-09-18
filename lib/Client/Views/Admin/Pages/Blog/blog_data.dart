import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../../DataBase/Controllers/blog_controller.dart';
import '../../../../../DataBase/Models/blog_post.dart';
import '../../../../../Services/image_service.dart';
import '../../Components/drop_zone.dart';
import '../../Components/loading_animation.dart';

class BlogData extends StatefulWidget {
  const BlogData({super.key, required this.blogPost, required this.onFinished});

  final BlogPost blogPost;
  final VoidCallback onFinished;

  @override
  State<BlogData> createState() => _BlogDataState();
}

class _BlogDataState extends State<BlogData> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  UploadTask? uploadTask;

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
                                SizedBox(height: size.height * 0.2, width: size.width * 0.2, child: Image.memory(data)),
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
                    onPressed: widget.onFinished,
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
                        widget.onFinished();
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

  late DropzoneViewController dropZoneController;
  Widget _buildDropZone() {
    return DropZone(
      onCreated: (DropzoneViewController controller) {
        dropZoneController = controller;
      },
      onDrop: (value) async {
        fileName = await dropZoneController.getFilename(value);
        data = await dropZoneController.getFileData(value);
        setState(() {
          fileUploaded = true;
        });
      },
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
    );
  }

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
          data = await ImageManager.compressImage(data);
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
        final Reference ref = FirebaseStorage.instance.ref(path);
        data = await ImageManager.compressImage(data);
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
