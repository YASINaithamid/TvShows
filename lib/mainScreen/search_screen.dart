import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter_offline/flutter_offline.dart';
import 'package:tv_shows/components/show_tile.dart';
import 'package:tv_shows/mainScreen/shows_screen.dart';

import '../authentication/login_screen.dart';
import '../components/custum_drawer.dart';
import '../components/loading_widget.dart';
import '../components/offline_widget.dart';
import '../core/api_service.dart';
import '../models/show.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  List<Show> _shows = <Show>[];

  Future<List<Show>> getShows() async {
    return await fetchShows(nameTextEditingController.text.toString())
        as List<Show>;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(connectivityBuilder: (
      BuildContext context,
      ConnectivityResult connectivity,
      Widget child,
    ) {
      if (connectivity == ConnectivityResult.none) {
        return OfflineMsg(
            title: "OFFLINE",
            message: 'Please check your network connectivity');
      } else {
        return child;
      }
    }, builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Search shows '),
        ),
        drawer: CustumizedDrawer(),
        body: SafeArea(
            child: Column(
          children: [
            TextField(
              autofocus: false,

              controller: nameTextEditingController,
              // controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: 'enter shows name',
              ),
            ),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  "search ".toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () async {
                _shows = await getShows();

                /* print(_shows);
                print(_shows[0].image); */
                //if you decomment this two print above the next if block will not be executed even if _shows.isEmpty==true lool :]
                if (_shows.isEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OfflineMsg(
                              title: "SHOW NOT VALID",
                              message:
                                  "Please enter the correct name for the show",
                            )),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowsScreen(shows: _shows)),
                  );
                }
              },
            ),
          ],
        )),
      );
    }); //
  }
}
