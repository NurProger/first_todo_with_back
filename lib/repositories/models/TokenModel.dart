import 'package:flutter/material.dart';
class Token extends ChangeNotifier{
  String token;
  Token({this.token = ''});

  void SaveToken({required newToken}){
    token = newToken;
    notifyListeners();
  }
}