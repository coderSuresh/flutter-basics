import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/image_model.dart';
import 'gallery.dart';

class Search extends StatefulWidget {
  final String searchQuery;

  const Search({Key? key, required this.searchQuery}) : super(key: key);
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<ImageModel> images = [];

  TextEditingController textEditingController = TextEditingController();

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
    getSearchingPhotos(widget.searchQuery);
    textEditingController.text = widget.searchQuery;
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        hintText: "search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Search(searchQuery: textEditingController.text),
                        ),
                      );
                    },
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            imageList(images: images, context: context),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
