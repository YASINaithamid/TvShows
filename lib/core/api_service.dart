import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/show.dart';

final String url = "https://api.tvmaze.com/search/shows?q=";

List<Show> parseUser(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  // print(list);

  List<Show> shows = [];
  for (var u in list) {
    if (u['show']['image']['medium'] == null) {
      u['show']['image']['medium'] =
          "https://static.tvmaze.com/uploads/images/medium_portrait/32/81364.jpg";
    }
    Show show = Show(
      id: u['show']['id'].toString(),
      name: u['show']['name'].toString(),
      type: u['show']['type'].toString(),
      language: u['show']['language'].toString(),
      genres: u['show']['genres'].toString(),
      image: u['show']['image']['medium'].toString(),
      summary: u['show']['summary'].toString(),
    );

    shows.add(show);
  }
  /*  print(shows);
  print(shows.length); */
  return shows;
}

Future<List<Show>> fetchShows(String q) async {
  final http.Response response = await http.get(Uri.parse('$url$q'));
  print("qqqqqqqqqqqqq" + q);

  if (response.statusCode == 200) {
    print('response.body');
    return compute(parseUser, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
