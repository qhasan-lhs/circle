import 'package:flutter/material.dart';
import 'package:circle/widgets/PostCard.dart';

class Post {
  Post({
    this.username,
    this.userimage,
    this.posttext,
    this.postimage,
    this.numlikes,
    this.numcomments,
  });

  String username;
  String userimage;
  String posttext;
  String postimage;
  int numlikes;
  int numcomments;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      username: json['username'],
      userimage: json['userimage'],
      posttext: json['posttext'],
      postimage: json['postimage'],
      numlikes: json['numlikes'],
      numcomments: json['numcomments'],
    );
  }

  Widget renderCard(BuildContext context) {
    return PostCard(this);
  }
}

class Posts {
  List<Post> postList;
  Posts({this.postList});

  factory Posts.fromJson(List jsons) {
    List<Post> posts = jsons.map((json) => Post.fromJson(json)).toList();
    return Posts(postList: posts);
  }
}
