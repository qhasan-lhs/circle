import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:circle/models/PostModel.dart';
import 'package:http_parser/http_parser.dart';

Future<Post> getPost() async {
  String url = 'https://circlesocial-server.com:3000/get/post';
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<Posts> getPosts() async {
  String url = 'https://circlesocial-server.com:3000/get/posts';
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Posts.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<Post> createPost(Map json) async {
  String url = 'https://circlesocial-server.com:3000/insert/post';
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(json),
  );

  print(response.body);
  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create');
  }
}

Future<Post> createPostWithImage(Map json) async {
  var uri =
      Uri.parse('https://circlesocial-server.com:3000/insert/post/withimage');
  var request = http.MultipartRequest('POST', uri)
    ..fields['username'] = json['username']
    ..fields['posttext'] = json['posttext']
    ..files.add(await http.MultipartFile.fromPath(
        'postimage', json['postimage'],
        contentType: MediaType('image', 'jpg')));
  // ..files.add(await http.MultipartFile.fromPath(
  //     'userimage', json['userimage'],
  //     contentType: MediaType('image', 'jpeg')));

  // await Future.forEach(
  //     files,
  //     (file) async => request.files.add(http.MultipartFile(
  //           'files',
  //           file,
  //           await file.length(),
  //           contentType: MediaType('image', 'jpg'),
  //         )));

  var stream = await request.send();
  var response = await http.Response.fromStream(stream);

  print(response.body);
  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create');
  }
}
