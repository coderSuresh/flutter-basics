import 'package:flutter/cupertino.dart';

class ImageModel {
  String photographer;
  int photographerId;
  String photographerUrl;
  SrcModel src;

  ImageModel(
      {required this.photographer,
      required this.photographerId,
      required this.photographerUrl,
      required this.src});

  factory ImageModel.fromMap(Map<String, dynamic> jsonData) {
    return ImageModel(
        src: SrcModel.fromMap(jsonData['src']),
        photographer: jsonData['photographer'],
        photographerUrl: jsonData['photographer_url'],
        photographerId: jsonData['photographer_id']);
  }
}

class SrcModel {
  String original;
  String portrait;
  String small;

  SrcModel(
      {required this.original, required this.portrait, required this.small});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        original: jsonData['original'],
        portrait: jsonData['portrait'],
        small: jsonData['small']);
  }
}
