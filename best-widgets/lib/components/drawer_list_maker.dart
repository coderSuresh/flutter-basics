import 'package:flutter/material.dart';

class DrawerListTileMaker extends StatefulWidget {
  final String title;
  final IconData iconData;

  const DrawerListTileMaker({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  State<DrawerListTileMaker> createState() => _DrawerListTileMakerState();
}

class _DrawerListTileMakerState extends State<DrawerListTileMaker> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.iconData),
      title: Text(widget.title, style: TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pop(context);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: Text("${widget.title} clicked!"),
            content:
                Text("You clicked on ${widget.title} from navigation drawer."),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Yes")),
            ],
          ),
        );
      },
    );
  }
}
