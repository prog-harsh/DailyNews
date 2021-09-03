import 'dart:convert';

import 'package:http/http.dart' as http;

class Functions {
  static const key = '9e041027dee746bdabe00fea9f2f864c';
  static fetchNewsTopHeadLines() async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=$key');
    var response = await http.get(url);
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  }
}
