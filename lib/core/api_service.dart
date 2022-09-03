import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/show.dart';

final String url = "https://api.tvmaze.com/search/shows?q=g";

List<Show> parseUser(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;

  List<Show> shows = [];
  for (var u in list) {
    Show show = Show(
      id: u['show']['id'].toString(),
      name: u['show']['name'].toString(),
      type: u['show']['type'].toString(),
      language: u['show']['language'].toString(),
      genres: u['show']['genres'],
      image: u['show']['image'],
      summary: u['show']['summary'].toString(),
    );
    if (u['show']['image'].medium == null) {
      show.image['medium'] =
          "https://static.tvmaze.com/uploads/images/medium_portrait/29/72974.jpg";
    }
    shows.add(show);
  }
  print(shows);
  return shows;
}

Future<List<Show>> fetchShows() async {
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print(response.body);
    return compute(parseUser, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
