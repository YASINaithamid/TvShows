import 'package:flutter/material.dart';

import 'package:flutter_offline/flutter_offline.dart';
import 'package:tv_shows/components/show_tile.dart';

import '../authentication/login_screen.dart';
import '../components/custum_drawer.dart';
import '../components/loading_widget.dart';
import '../core/api_service.dart';
import '../models/show.dart';

class ShowsScreen extends StatefulWidget {
  const ShowsScreen({Key? key}) : super(key: key);

  @override
  State<ShowsScreen> createState() => _ShowsScreenState();
}

class _ShowsScreenState extends State<ShowsScreen> {
  List<Show> _shows = <Show>[];
  List<Show> _showsDisplay = <Show>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchShows().then((value) {
      setState(() {
        _isLoading = false;
        _shows.addAll(value);
        _showsDisplay = _shows;
        print(_showsDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(connectivityBuilder: (
      BuildContext context,
      ConnectivityResult connectivity,
      Widget child,
    ) {
      if (connectivity == ConnectivityResult.none) {
        return OfflineMsg();
      } else {
        return child;
      }
    }, builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Serach for shows'),
        ),
        drawer: CustumizedDrawer(),
        body: SafeArea(
          child: Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (!_isLoading) {
                  return index == 0
                      ? _searchBar()
                      : ShowTile(show: this._showsDisplay[index - 1]);
                } else {
                  return LoadingView();
                }
              },
              itemCount: _showsDisplay.length + 1,
            ),
          ),
        ),
      );
    }); //
  }

  //serchFunct

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            _showsDisplay = _shows.where((u) {
              var name = u.name.toLowerCase();
              var type = u.type.toLowerCase();
              var language = u.language.toLowerCase();
              return name.contains(searchText);
            }).toList();
          });
        },
        // controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search shows',
        ),
      ),
    );
  }
}
