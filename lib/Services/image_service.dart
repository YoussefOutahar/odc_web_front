import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';

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
  static Future<Uint8List> compressImage(Uint8List image, String path) async {
    debugPrint('Compressing image');
    debugPrint('Image size: ${image.length}');
    Uint8List? result;
    try {
      // Convert image to file
      final ImageFile imageFile = ImageFile(rawBytes: image, filePath: path);

      Configuration configuration = Configuration(
        outputType: ImageOutputType.png,
        quality: calculateProportionalQuality(image.length),
        useJpgPngNativeCompressor: false,
      );
      final param = ImageFileConfiguration(input: imageFile, config: configuration);
      ImageFile tmp = await compressor.compressWebpThenPng(param);

      result = tmp.rawBytes;
      // result = await FlutterImageCompress.compressWithList(
      //   image,
      // );
    } catch (e) {
      debugPrint('Error compressing image: $e');
      result = image;
    }
    debugPrint('Compressed image size: ${result.length}');
    return result;
  }

  static int calculateProportionalQuality(int size) {
    int quality = 100;
    if (size > 1000000) {
      quality = 10;
    } else if (size > 500000) {
      quality = 20;
    } else if (size > 250000) {
      quality = 30;
    } else if (size > 100000) {
      quality = 40;
    } else if (size > 50000) {
      quality = 50;
    } else if (size > 25000) {
      quality = 60;
    } else if (size > 10000) {
      quality = 70;
    } else if (size > 5000) {
      quality = 80;
    } else if (size > 1000) {
      quality = 90;
    }
    return quality;
  }
}
