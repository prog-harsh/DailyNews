import 'dart:convert';

import 'package:http/http.dart' as http;

class Functions {
  static const key = '9e041027dee746bdabe00fea9f2f864c';
  static late Map<String, dynamic> data;
  static fetchNewsTopHeadLines() async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&apiKey=$key');
      var response = await http.get(url);
      data = json.decode(response.body);
    } catch (e) {
      print(e);
    }

    return data;
  }

  static fetchSportsNews() async {
    try {
      var url =
          Uri.parse('https://newsapi.org/v2/everything?q=sports&apiKey=$key');
      var response = await http.get(url);
      data = json.decode(response.body);
    } catch (e) {
      print(e);
    }
    return data;
  }

  static fetchBusinessNews() async {
    try {
      var url =
          Uri.parse('https://newsapi.org/v2/everything?q=business&apiKey=$key');
      var response = await http.get(url);
      data = json.decode(response.body);
    } catch (e) {
      print(e);
    }
    return data;
  }

  static fetchGamingNews() async {
    try {
      var url =
          Uri.parse('https://newsapi.org/v2/everything?q=gaming&apiKey=$key');
      var response = await http.get(url);
      data = json.decode(response.body);
    } catch (e) {
      print(e);
    }

    return data;
  }

  static fetchScieneNews() async {
    var url =
        Uri.parse('https://newsapi.org/v2/everything?q=science&apiKey=$key');
    var response = await http.get(url);
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  }
}
