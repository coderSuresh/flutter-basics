import 'package:flutter/material.dart';

import '../components/drawer_list_maker.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  static String bodyText = '';

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String accountName = "Coder Suresh";
  String accountEmail = "codersuresh@protonmail.com";
  int chosen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Best Widgets"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("About"),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text("Website"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Share"),
                  value: 2,
                ),
              ];
            },
            onSelected: (value) {
              switch (value) {
                case 0:
                  setState(() {
                    Home.bodyText = "You clicked on about";
                  });
                  break;
                case 1:
                  setState(() {
                    Home.bodyText = "You clicked on website";
                  });
                  break;
                case 2:
                  setState(() {
                    Home.bodyText = "You clicked on share";
                  });
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Account"),
        ],
        currentIndex: chosen,
        onTap: (i) {
          chosen = i;
          switch (i) {
            case 0:
              setState(() {
                Home.bodyText = "Bottom navigation home clicked";
              });
              break;
            case 1:
              setState(() {
                Home.bodyText = "Bottom navigation notification clicked";
              });
              break;
            case 2:
              setState(() {
                Home.bodyText = "Bottom navigation account clicked";
              });
          }
        },
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          UserAccountsDrawerHeader(
            accountName: Text(accountName),
            accountEmail: Text(accountEmail),
            currentAccountPicture: CircleAvatar(
              child: Text(
                "C",
                style: TextStyle(fontSize: 30),
              ),
            ),
            margin: EdgeInsets.zero,
          ),
          Column(
            children: [
              DrawerListTileMaker(
                title: "Home",
                iconData: Icons.home,
              ),
              Divider(color: Colors.deepPurple.shade900),
              DrawerListTileMaker(
                title: "Settings",
                iconData: Icons.settings,
              ),
              Divider(color: Colors.deepPurple.shade900),
            ],
          ),
        ]),
      ),
      body: Center(
        child: Text(
          Home.bodyText,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
