import 'package:flutter/material.dart';
import 'package:image_gallery/screens/categories.dart';
import '../constants.dart';

class CategoryMaker extends StatelessWidget {
  final String title;
  final String img;

  const CategoryMaker({Key? key, required this.title, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Category(catName: title.toLowerCase()),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(img,
                    height: 50, width: 100, fit: BoxFit.cover)),
            Container(
              height: 50,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black45,
              ),
              child: Text(
                title,
                style:
                    const TextStyle(color: kWhite, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
