import 'package:flutter/material.dart';

class Des extends ChangeNotifier {
  List<Map<String, dynamic>> posts = [];

  void savePost({required newPost}) {
    posts = newPost;
    notifyListeners();
  }
}
