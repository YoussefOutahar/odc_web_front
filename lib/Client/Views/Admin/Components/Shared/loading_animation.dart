import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key, required this.uploadTask});

  final UploadTask uploadTask;

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.uploadTask.snapshotEvents,
      builder: (BuildContext context, AsyncSnapshot<TaskSnapshot> snapshot) {
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
    );
  }
}
