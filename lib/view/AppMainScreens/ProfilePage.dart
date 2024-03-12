import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/models/UserModels.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _HomePageState();
}
class _HomePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final name = context.watch<UserModel>().name;
    final email = context.watch<UserModel>().email;
    return Scaffold(
    backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 120),
        child: Center(
          child: Column(
            children: [
              const Stack(
                alignment:Alignment.center,
                children: [
                  CircleAvatar(
                      radius: 99,
                      backgroundColor: Colors.grey,
                    ),
                  CircleAvatar(
                    radius: 96,
                    backgroundImage: AssetImage("assets/actor.jpg"),
                  ),
                ],
              ),
              Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [SizedBox(height: 60,),
                        Text("Name", style: TextStyle(fontSize: 15 , color: Colors.blue, fontWeight: FontWeight.bold),),
                        TextLineStyl(name),
                        SizedBox(height: 20,),
                        Text("Email", style: TextStyle(fontSize: 15 , color: Colors.blue, fontWeight: FontWeight.bold),),
                        TextLineStyl(email),
                        SizedBox(height: 20,),
                        Text("Number", style: TextStyle(fontSize: 15 , color: Colors.blue, fontWeight: FontWeight.bold),),
                        TextLineStyl("+7"),
                      ],
                    )),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
TextLineStyl(name){
  return Padding(
    padding: const EdgeInsets.all(0.0),
    child: Container(
      width: 350,
        decoration: const  BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey,
                    width: 1
                )
            )
        ),
        child: Text("$name" , style: TextStyle(fontSize: 25,color: Colors.black38),)
    ),
  );
}