import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class CachedImageManager extends StatelessWidget {
  const CachedImageManager({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

class ImageManager {
  static Future<Uint8List> compressImage(Uint8List image) async {
    debugPrint('Compressing image');
    debugPrint('Image size: ${image.length}');
    Uint8List? result;
    try {
      // Todo: Fix Compression null error
      result = await FlutterImageCompress.compressWithList(
        image,
        autoCorrectionAngle: false,
        keepExif: true,
      );
    } catch (e) {
      debugPrint('Error compressing image: $e');
      result = image;
    }
    debugPrint('Compressed image size: ${result.length}');
    return result;
  }
}
