import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image_gallery/constants.dart';

class FullImg extends StatefulWidget {
  final String imgUrl;

  const FullImg({Key? key, required this.imgUrl}) : super(key: key);
  @override
  State<FullImg> createState() => _FullImgState();
}

class _FullImgState extends State<FullImg> {
  Future<void> setWallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imgUrl);
    bool res = await WallpaperManager.setWallpaperFromFile(file.path, location);

    if (res) {
      SnackBar(
        content: const Text("Wallpaper set successfully."),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    } else {
      SnackBar(
        content: const Text("Failed to set wallpaper!"),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: widget.imgUrl,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.black38),
                onPressed: () {
                  setWallpaper();
                },
                child: const Text(
                  "Set Wallpaper",
                  style: TextStyle(fontSize: 18, color: kWhite),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.black38),
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontSize: 14, color: kWhite),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
