import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tv_shows/mainScreen/shows_screen.dart';

class CustumizedDrawer extends StatefulWidget {
  const CustumizedDrawer({Key? key}) : super(key: key);

  @override
  State<CustumizedDrawer> createState() => _CustumizedDrawerState();
}

class _CustumizedDrawerState extends State<CustumizedDrawer> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  String? username = '';
  String? email = '';

  /* void retrieve() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username");
    email = prefs.getString("email");
    setState(() {});
  } */

  @override
  void initState() {
    super.initState();
    //retrieve();

    ///whatever you want to run on page build
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
              0.0,
              1.0
            ],
                colors: [
              Theme.of(context).primaryColor.withOpacity(0.2),
              Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            ])),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).colorScheme.secondary,
                  ],
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  Text(
                    'Mr. $username',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$email',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontFeatures: [
                        FontFeature.enable('sups'),
                      ],
                    ),
                  )
                ]),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                'Shows',
                style: TextStyle(
                    fontSize: _drawerFontSize,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowsScreen()),
                );
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.manage_accounts,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                    fontSize: _drawerFontSize,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () {
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BusList()),
                ); */
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                    fontSize: _drawerFontSize,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () {},
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
