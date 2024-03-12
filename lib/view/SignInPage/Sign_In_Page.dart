import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/view/MainPage.dart';

import '../AppMainScreens/HomePage.dart';
import '../SignUpPage/Sign_Up_Page.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {

    TextEditingController Number = TextEditingController();
    TextEditingController Password = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 25.0,left: 25,top: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Welcome back",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "make your day happu with NurTodo",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 50,),
              TextFormField(
                controller: Number,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2
                    )
                  )
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                controller: Password,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2
                        )
                    )
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 50),
                  backgroundColor: Colors.blue[300]
                ),
                  onPressed: (){
                  },
                  child: Text("Start", style: TextStyle(color: Colors.white),)
              ),
              SizedBox(height: 200,),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>SignUpPage())
                    );
                  },
                  child: Text("Registr now!",style: TextStyle(color: Colors.blue),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
