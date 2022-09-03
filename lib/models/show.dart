/* {"score":0.61315787,
"show":{"id":7988,"url":"https://www.tvmaze.com/shows/7988/whatcha-got","name":"What'Cha Got","type":"Documentary","language":"English","genres":["Sports"],"status":"Ended","runtime":3,"averageRuntime":3,"premiered":"2014-10-19","ended":"2015-11-01","officialSite":null,
"schedule":{"time":"","days":["Sunday"]},
"rating":{"average":null},
"weight":19,
"network":{"id":72,"name":"Syndication","country":{"name":"United States","code":"US","timezone":"America/New_York"},"officialSite":null},"webChannel":null,"dvdCountry":null,"externals":{"tvrage":null,"thetvdb":null,"imdb":"tt4170806"},
"image":{"medium":"https://static.tvmaze.com/uploads/images/medium_portrait/29/72974.jpg",
"original":"https://static.tvmaze.com/uploads/images/original_untouched/29/72974.jpg"},
"summary":"<p><b>What'Cha Got</b> profiles sports and entertainment personalities and their automotive character.</p>",
"updated":1622031405,"_links":{"self":{"href":"https://api.tvmaze.com/shows/7988"},
"previousepisode":{"href":"https://api.tvmaze.com/episodes/442306"}}}} */
class Show {
  final String id;
  final String name;
  final String type;
  final String language;
  final List<dynamic> genres;
  final dynamic image;
  final String summary;

  const Show(
      {required this.id,
      required this.name,
      required this.type,
      required this.language,
      required this.genres,
      required this.image,
      required this.summary});

  /* Show.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name= json['name'];
    language = json['language'];
    email = json['email'];
    gender = json['gender'];
    image = json['image'];
    profile = json['profile'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['profile'] = this.profile;
    data['job'] = this.job;
    return data;
  } */
}


/* {"score":0.61315787,
"show":{"id":7988,"url":"https://www.tvmaze.com/shows/7988/whatcha-got","name":"What'Cha Got","type":"Documentary","language":"English","genres":["Sports"],"status":"Ended","runtime":3,"averageRuntime":3,"premiered":"2014-10-19","ended":"2015-11-01","officialSite":null,
"schedule":{"time":"","days":["Sunday"]},
"rating":{"average":null},
"weight":19,
"network":{"id":72,"name":"Syndication","country":{"name":"United States","code":"US","timezone":"America/New_York"},"officialSite":null},"webChannel":null,"dvdCountry":null,"externals":{"tvrage":null,"thetvdb":null,"imdb":"tt4170806"},
"image":{"medium":"https://static.tvmaze.com/uploads/images/medium_portrait/29/72974.jpg",
"original":"https://static.tvmaze.com/uploads/images/original_untouched/29/72974.jpg"},
"summary":"<p><b>What'Cha Got</b> profiles sports and entertainment personalities and their automotive character.</p>",
"updated":1622031405,"_links":{"self":{"href":"https://api.tvmaze.com/shows/7988"},
"previousepisode":{"href":"https://api.tvmaze.com/episodes/442306"}}}} */