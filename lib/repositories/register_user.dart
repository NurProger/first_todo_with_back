import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:todo/repositories/helpers/helpers.dart';
import 'package:todo/repositories/models/TokenModel.dart';
import 'package:todo/repositories/models/UserModels.dart';
import 'package:todo/view/MainPage.dart';


Future registerUser(BuildContext context,
    String passwordConfirm, String password, String fullName, String email) async {
  try {
    const Token = "eyJpdiI6IjAvUVJnSDVCL0NYbWJDTHl2RGs5elE9PSIsInZhbHVlIjoid2haektJNEpxQWtCOEZFSUthMXR3MjF4TnJGVDkxVXFKWnlqWW1WVTV5N0VxMm9TWTBOc1F3ckRuNFVqNnpGWlEyN3VTeW0xRGo2S1pqN0lDM3F3eVd3VDBQUmRRK3NKNHlYYnFTQ2VVWWkxbjFseVhXY3U4ZnF2L0ZFbi9JV3kiLCJtYWMiOiI2NzcwMGY3NTcwNDY0N2JhYTc0Y2QzODQ2MDQwNTBhNTlmMjJiMTNiMTk4OGM3OGMwMjU0ZjAwMWQ1YWRmMDIyIiwidGFnIjoiIn0";
    const Cookie = "XSRF-TOKEN=eyJpdiI6ImhzSGdkeTgyMXV5Z2pqUVdQVHczN1E9PSIsInZhbHVlIjoib1N3a2owekFtTnFYMGZnSnI2L25IYXM5Y1Q4bHNRM1RvTExQVUdEdmFpMm5zdkI5L3N1bXdZMVhCNXlVQ2JIYWRPamE4cnF0WWVJdFFVUWM2Y1V3NHhoQ0JaLzk5c05YSVR6R1RsMTdUWDQyNUhtVzFHKzFDQjUwSU85SEtDZTQiLCJtYWMiOiI3ZmJhYzdjMjI4MGE4ZDI2YWFiMjcxYzUwMTJmNzM0OGJkNGFhM2IzYmQ0NTVlMmY5ZjE4OGQ1NjA0MzA1ZTNiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkZPTFVacnlBNnJ5ZHcxbElRVWlLN0E9PSIsInZhbHVlIjoiR1pTYU1PeUhET0x0RTRSWjRHR3VWL2o5THhRUVl3c09VV1NaZjh0VXo3SGc5MEJnV2pjd0tlZ3czd1JNbzBKWTI5cko0T1dyMEtZUkNWS1JSK3A4aVRXdjZIM1dRWjlNMFpSTTl4S3FNamhWMStJTi9Ib0h4M3RZWVgweVZma3MiLCJtYWMiOiI4NDJhNjM3ZjFiN2IwM2RkOGQwZTMxMjE5OTdiNzU5ZWZlOTI4NjEwYWRmMzNmYWI5OGY5MTM4MzY1MTZkNzcwIiwidGFnIjoiIn0%3D";
    final requestBody = {
      "name": fullName,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirm,
    };

    final response = await http.post(
      Uri.parse(API.register),
      headers: {"Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      "Cookie": Cookie,
        "X-XSRF-TOKEN":Token
      },
      body: requestBody,
    );
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final userName = jsonResponse['name'];
      final userEmail = jsonResponse['email'];
      final ID = jsonResponse['id'];
      context.read<UserModel>().SaveUser(newName: userName,newEmail: userEmail, newID: ID);
      Access_tokens(context , password , email);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      print("Registration failed ${response.body}");
    }
  } catch (e) {
    print("Error during registration: $e");
  }
}
Future Access_tokens(BuildContext contex,
    String password, String email) async {
  try {
    const Cookie = "XSRF-TOKEN=eyJpdiI6ImhzSGdkeTgyMXV5Z2pqUVdQVHczN1E9PSIsInZhbHVlIjoib1N3a2owekFtTnFYMGZnSnI2L25IYXM5Y1Q4bHNRM1RvTExQVUdEdmFpMm5zdkI5L3N1bXdZMVhCNXlVQ2JIYWRPamE4cnF0WWVJdFFVUWM2Y1V3NHhoQ0JaLzk5c05YSVR6R1RsMTdUWDQyNUhtVzFHKzFDQjUwSU85SEtDZTQiLCJtYWMiOiI3ZmJhYzdjMjI4MGE4ZDI2YWFiMjcxYzUwMTJmNzM0OGJkNGFhM2IzYmQ0NTVlMmY5ZjE4OGQ1NjA0MzA1ZTNiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkZPTFVacnlBNnJ5ZHcxbElRVWlLN0E9PSIsInZhbHVlIjoiR1pTYU1PeUhET0x0RTRSWjRHR3VWL2o5THhRUVl3c09VV1NaZjh0VXo3SGc5MEJnV2pjd0tlZ3czd1JNbzBKWTI5cko0T1dyMEtZUkNWS1JSK3A4aVRXdjZIM1dRWjlNMFpSTTl4S3FNamhWMStJTi9Ib0h4M3RZWVgweVZma3MiLCJtYWMiOiI4NDJhNjM3ZjFiN2IwM2RkOGQwZTMxMjE5OTdiNzU5ZWZlOTI4NjEwYWRmMzNmYWI5OGY5MTM4MzY1MTZkNzcwIiwidGFnIjoiIn0%3D";
    final requestBody = {
      "email": email,
      "password": password,
      "device_name": "laptop"
    };

    final response = await http.post(
      Uri.parse(API.access_tokens),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "Cookie": Cookie,
      },
      body: requestBody,
    );
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final token = jsonResponse["token"];
      contex.read<Token>().SaveToken(newToken: token);
      print("Registration successful");
    } else {
      print("Registration failed${response.body}");
    }
  } catch (e) {
    print("Error during registration: $e");
  }
}
