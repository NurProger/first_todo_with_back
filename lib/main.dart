import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/repositories/models/TokenModel.dart';
import 'package:todo/repositories/models/UserModels.dart';
import 'package:todo/repositories/models/descModel.dart';
import 'package:todo/repositories/models/postId.dart';
import 'package:todo/view/MainPage.dart';
import 'package:todo/view/SignInPage/Sign_In_Page.dart';
import 'package:todo/view/SignUpPage/Sign_Up_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create:(context) => UserModel()
        ),
        ChangeNotifierProvider(
            create:(context) => Token()
        ),
        ChangeNotifierProvider(
            create:(context) => Des()
        ),
        ChangeNotifierProvider(
            create:(context) => PostId()
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor:  Colors.white,
          hintColor: Colors.blue,

        ),
        home: Scaffold(
          body: SignUpPage(),
        ),
      ),
    );
  }
}
