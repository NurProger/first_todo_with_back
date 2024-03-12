import 'package:flutter/material.dart';
class PostId extends ChangeNotifier{
  int postId = 0;

  void saveId({required newId}){
    postId = newId;
    notifyListeners();
  }
}