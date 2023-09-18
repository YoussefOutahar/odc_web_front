import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:lottie/lottie.dart';

class DropZone extends StatefulWidget {
  const DropZone({super.key, required this.onDrop, required this.onTap, this.onCreated});

  final Function(dynamic)? onDrop;
  final Function(DropzoneViewController)? onCreated;
  final VoidCallback onTap;

  @override
  State<DropZone> createState() => _DropZoneState();
}

class _DropZoneState extends State<DropZone> {
  bool _startAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            onCreated: widget.onCreated,
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
            onDrop: widget.onDrop,
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
            onTap: widget.onTap,
          ),
        )
      ],
    );
  }
}
