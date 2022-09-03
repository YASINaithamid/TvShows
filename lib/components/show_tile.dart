import 'package:flutter/material.dart';
import 'package:tv_shows/models/show.dart';

class ShowTile extends StatelessWidget {
  final Show show;

  ShowTile({required this.show});

  /*  String userTitle() {
    String title = "";
    if (show.gender == "Male") {
      title = "Mr.";
    } else if (show.gender == "Female") {
      title = "Ms.";
    }
    return title;
  } */

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: show.id,
              child: CircleAvatar(
                backgroundImage: NetworkImage(show.image['medium']),
              ),
            ),
            title: Text(' ${show.name} ${show.genres}'),
            subtitle: Text(show.summary),
            onTap: () {
              /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserDetailsPage(user: user)));
            */
            },
          ),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
