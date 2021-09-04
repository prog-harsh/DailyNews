import 'package:daily_news/functions.dart';
import 'package:daily_news/widgets/main_drawer.dart';
import 'package:daily_news/widgets/news_tiles.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _sports = false, _business = false, _science = false, _gaming = false;

  @override
  void initState() {
    Functions.fetchNewsTopHeadLines();

    super.initState();
  }

  selectedCategory(category) {
    if (category == "Sports") {
      _sports = true;
      _science = false;
      _business = false;
      _gaming = false;
    } else if (category == "Top Headlines") {
      _sports = false;
      _business = false;
      _science = false;
      _gaming = false;
    } else if (category == "Business") {
      _business = true;
      _science = false;
      _sports = false;
      _gaming = false;
    } else if (category == "Science") {
      _science = true;
      _business = false;
      _sports = false;
      _gaming = false;
    } else if (category == "Gaming") {
      _science = true;
      _business = false;
      _sports = false;
      _gaming = true;
    }
    setState(() {});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DailyNews',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        elevation: 0,
      ),
      drawer: MainDrawer(selectedCategory),
      body: FutureBuilder(
        future: _gaming
            ? Functions.fetchGamingNews()
            : _science
                ? Functions.fetchScieneNews()
                : _business
                    ? Functions.fetchBusinessNews()
                    : _sports
                        ? Functions.fetchSportsNews()
                        : Functions.fetchNewsTopHeadLines(),
        builder: (ctx, s) {
          if (s.connectionState == ConnectionState.waiting || !s.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final Map<String, dynamic> data = s.data as Map<String, dynamic>;
          return NewsTiles(data);
        },
      ),
    );
  }
}
