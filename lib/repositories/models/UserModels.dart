import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier{
  String name;
  String email;
  int id;
  UserModel({
    this.name = '',
    this.email = '',
    this.id = -1,
  });
  void SaveUser({required newName , required newEmail, required newID})async{
    name = newName;
    email = newEmail;
    id = newID;
    notifyListeners();
  }
}