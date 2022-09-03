import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tv_shows/models/show.dart';

class ShowTile extends StatelessWidget {
  final Show show;

  ShowTile({required this.show});

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
                backgroundImage: NetworkImage(show.image),
              ),
            ),
            title: Text(' ${show.name} ${show.genres}'),
            subtitle: Text(show.summary),
          ),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
