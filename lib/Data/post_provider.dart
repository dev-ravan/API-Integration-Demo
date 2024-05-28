import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostsProvider extends ChangeNotifier {
  // Declare the var and assign the Client
  final client = http.Client();

  List postsList = [];

  Future fetchPosts() async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    final result = jsonDecode(response.body);
    return result;
  }

  void listOfPosts() {
    fetchPosts().then((value) {
      postsList = value;
      notifyListeners();
    });
  }
}
