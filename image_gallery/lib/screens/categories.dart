import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/image_model.dart';
import 'gallery.dart';

class Category extends StatefulWidget {
  final String catName;

  const Category({Key? key, required this.catName}) : super(key: key);
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<ImageModel> images = [];

  void getSearchingPhotos(String query) async {
    http.Response response = await http.get(
      Uri.parse(
          "https://api.pexels.com/v1/search?query=$query&per_page=40&page=1"),
      headers: {"Authorization": apiKey},
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((value) {
      ImageModel imageModel = ImageModel.fromMap(value);
      images.add(imageModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getSearchingPhotos(widget.catName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Gallery",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            imageList(images: images, context: context),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
