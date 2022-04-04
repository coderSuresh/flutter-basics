import 'package:flutter/material.dart';
import 'package:image_gallery/screens/full_img.dart';
import '../model/image_model.dart';

Widget imageList({required List<ImageModel> images, context}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: images.map((img) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullImg(imgUrl: img.src.portrait),
                ),
              );
            },
            child: Hero(
              tag: img.src.portrait,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(img.src.portrait, fit: BoxFit.cover),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
