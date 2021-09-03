import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
        primaryColor: Color(0xff171717),
        canvasColor: Color(0xff171717),
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          caption: TextStyle(
            color: Colors.white.withAlpha(180),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}