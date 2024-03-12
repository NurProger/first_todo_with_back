import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/repositories/models/UserModels.dart';
import 'package:todo/repositories/models/descModel.dart';
import 'package:todo/repositories/models/postId.dart';
import 'package:todo/repositories/post_posts.dart';
import 'package:todo/view/AppMainScreens/EditPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final posts = context.watch<Des>().posts;
    final name = context.watch<UserModel>().name;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Text('ToDo',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    SizedBox(width: 230,),
                    Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(width: 10,),
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage("assets/actor.jpg"),

                    )
                  ],
                ),
              ),
              SizedBox(height:25,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome, $name", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text("You have got ${posts.length} tasks", style: TextStyle(color: Colors.grey,fontSize: 16),),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (build,index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          decoration:BoxDecoration(
                              color: Color.fromRGBO(245, 247, 249, 1.0),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: ListTile(
                            title: Text(posts[index]['title'] ?? ''),
                            subtitle: Text(posts[index]['description'],maxLines: 1,),
                            trailing: PopupMenuButton(
                              itemBuilder: (BuildContext context) => const [
                                PopupMenuItem(child: Text("Update"),
                                value: 'update',
                                ),
                                PopupMenuItem(child: Text("Delete"),
                                  value: 'delete',),
                              ],
                              onSelected:(value) {
                                PostId idProvider = Provider.of<PostId>(context , listen:  false);
                                idProvider.saveId(newId: posts[index]['id']);
                                if (value == 'update'){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (
                                      context) => EditPage()));
                                }else
                                    Posts().deletePost(context);
                                    Posts().getPosts(context);
                              },
                            ),
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
