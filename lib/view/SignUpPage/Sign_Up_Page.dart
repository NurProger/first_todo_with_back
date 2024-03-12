import 'package:flutter/material.dart';
import 'package:todo/repositories/helpers/helpers.dart';
import 'package:todo/repositories/register_user.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
TextEditingController Password_confirm = TextEditingController();
TextEditingController Password = TextEditingController();
TextEditingController Fullname = TextEditingController();
TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 25.0,left: 25,top: 150),
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
                controller: Fullname,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "Fullname",
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
                controller: email,
                decoration: InputDecoration(
                    hintText: "email",
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
                decoration: InputDecoration(
                    hintText: "Password",
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
                controller: Password_confirm,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password confirm",
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
                  backgroundColor: Colors.blue[300],
                ),
                onPressed: () {
                  registerUser(context,Password_confirm.text, Password.text, Fullname.text, email.text);
                },
                child: Text("Register", style: TextStyle(color: Colors.white)),
              ),

              SizedBox(height: 200,),
            ],
          ),
        ),
      ),
    );
  }
}
