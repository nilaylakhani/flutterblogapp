import 'package:blogappdemo/models/blog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class RemoteServices {
  static var client = http.Client();
  static var accessToken = '';
  static String baseUrl = 'https://60585b2ec3f49200173adcec.mockapi.io/api/v1/';

  static Uri getUrl(String endPoint) {
    return Uri.https(baseUrl, endPoint);
  }

  //Login Request
  static void sendLoginRequest(
      String emailId, String password, BuildContext context) async {
    var postBodyData = {"email": emailId, "password": password};

    var response = await client.post(baseUrl + 'login', body: postBodyData);

    if (response.statusCode == 201) //success
    {
      Map<String, dynamic> responseJson = json.decode(response.body);
      accessToken = responseJson["token"];
      //open blogList Screen
      Navigator.of(context).pushNamed('/blogList');
      print('login Success.');
    } else {
      print('Failed to get data from server.');
    }
  }

  //Get all blogs.
  static Future<List<Blog>> getBlogs() async {
    var response = await client.get(baseUrl + 'blogs', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $accessToken',
    });

    if (response.statusCode == 200) //success
    {
      var jsonString = response.body;
      return blogFromJson(jsonString);
    } else {
      print(response.statusCode);
      print('Failed to get blogs.');
      return null;
    }
  }
}
