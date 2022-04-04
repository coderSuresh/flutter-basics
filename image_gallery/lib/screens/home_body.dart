import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery/data/data.dart';
import 'package:image_gallery/model/category_model.dart';
import 'package:image_gallery/model/image_model.dart';
import 'package:image_gallery/screens/gallery.dart';
import 'package:image_gallery/screens/search.dart';

import '../class/category_maker.dart';
import '../constants.dart';
import '../networking/network_check.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categoryList = [];
  List<ImageModel> images = [];

  TextEditingController textEditingController = TextEditingController();

  bool isConnected = false;
  ConnectivityResult result = ConnectivityResult.none;

  void getTrendingPhotos() async {
    http.Response response = await http.get(
      Uri.parse("https://api.pexels.com/v1/curated?per_page=40&page=1"),
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
    getConnectionAndRedirect(
        isConnected: isConnected, context: context, result: result);
    getTrendingPhotos();
    categoryList = getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          SizedBox(
            height: 80,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return CategoryMaker(
                    title: categoryList[index].categoryTitle,
                    img: categoryList[index].imgUrl);
              },
            ),
          ),
          imageList(images: images, context: context),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
