import "dart:convert";
import "package:flutter/cupertino.dart";
import "package:http/http.dart" as http;
import "package:provider/provider.dart";
import "package:todo/repositories/helpers/helpers.dart";
import "package:todo/repositories/models/TokenModel.dart";
import "package:todo/repositories/models/UserModels.dart";
import "package:todo/repositories/models/descModel.dart";
import "package:todo/repositories/models/postId.dart";
class Posts{
  Future postPosts(BuildContext context , description , title)async{
    final token = context.read<Token>().token;
      try{
      final requestBody = {
          "description" : description,
          "title" : title
        };
        final response = await http.post(Uri.parse(API.post_posts),
            headers:{
              "Authorization": "Bearer $token",
              "Accept": "application/json",
            },
            body: requestBody
        );
        final jsonResponse = jsonDecode(response.body);
        if(response.statusCode == 200){
          print(jsonResponse);
        }else{
          print(response.statusCode);
        }
      }catch(e){
        print("have an error: $e");
      }
    }

    Future getPosts(BuildContext context)async{
      final id = context.read<UserModel>();
      List<Map<String,dynamic>> posts = [];
      try{
      final response = await http.get(Uri.parse("http://10.0.2.2:8000/api/user/posts/${id.id}"),
      headers: {
        "Accept": "application/json"
      }
      );
      if(response.statusCode == 200){
          final List<dynamic> decodeData = jsonDecode(response.body);
          posts = List<Map<String,dynamic>>.from(decodeData);
          print(id);
          Des desProvider = Provider.of<Des>(context , listen:  false);
          desProvider.savePost(newPost: posts);
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print(e);
    }
    }

    Future updatePost(BuildContext context , description , title)async{
      final token = context.read<Token>().token;
      final postId = context.read<PostId>();
      try{
        final requestBody = {
          "description" : description,
          "title" : title
        };
        final response = await http.put(Uri.parse("http://10.0.2.2:8000/api/post/update/${postId.postId}"),
            headers:{
              "Authorization": "Bearer $token",
              "Accept": "application/json",
            },
            body: requestBody
        );
        final jsonResponse = jsonDecode(response.body);
        if(response.statusCode == 200){
          print(jsonResponse);
          print(postId.postId);
          print("good");
        }else{
          print(response.statusCode);
        }
      }catch(e){
        print("have an error: $e");
      }
    }
  Future deletePost(BuildContext context )async{
    final token = context.read<Token>().token;
    final postId = context.read<PostId>();
    try{
      final response = await http.delete(Uri.parse("http://10.0.2.2:8000/api/post/delete/${postId.postId}"),
          headers:{
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
      );
      final jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200){
        print(jsonResponse);;
        print("good");
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print("have an error: $e");
    }
  }
}
