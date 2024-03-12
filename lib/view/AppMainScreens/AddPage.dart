import 'package:flutter/material.dart';
import 'package:todo/repositories/post_posts.dart';
import 'package:todo/view/MainPage.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _HomePageState();
}

class _HomePageState extends State<AddPage> {
  TextEditingController TitleController = TextEditingController();
  TextEditingController DescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 150),
          child: Column(
            children: [
              Text('Creating post', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),),
              SizedBox(height: 70,),
              TextFormField(
                controller: DescController,
                decoration: InputDecoration(
                  hintText: "Write yore task name",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 200,
                child: TextFormField(
                  controller: TitleController,
                  maxLines: 100 ~/ 20,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: "Add a note ...",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Posts().postPosts(context,TitleController.text , DescController.text);
                      Posts().getPosts(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MainPage()));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12    )
                    ),
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Create",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
