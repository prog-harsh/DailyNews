import 'package:daily_news/functions.dart';
import 'package:daily_news/widgets/news_tiles.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    fetchNewsTopHeadLines();

    super.initState();
  }

  fetchNewsTopHeadLines() async {
    final data = await Functions.fetchNewsTopHeadLines();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DailyNews'),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: fetchNewsTopHeadLines(),
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
