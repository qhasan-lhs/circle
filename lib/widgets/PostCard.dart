import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

import 'package:circle/models/PostModel.dart';

import 'package:circle/widgets/MenuButton.dart';

class PostCard extends StatelessWidget {
  PostCard(this.aPost);
  final Post aPost;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Card>[
        Card(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: InkWell(
            splashColor: Colors.grey[200],
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  pcHeader(context, aPost),
                  pcBody(context, aPost),
                  pcFooter(context, aPost),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget pcHeader(BuildContext context, Post post) {
  return Row(
    children: <Widget>[
      CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(post.userimage),
      ),
      SizedBox(width: 10.0),
      Container(
        width: 250.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Text>[
            Text(post.username),
            Text('5 minutes ago'),
          ],
        ),
      ),
      SizedBox(width: 10.0),
      menuButton(context),
    ],
  );
}

Widget pcBody(BuildContext context, Post post) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          SizedBox(width: 10.0),
          Text(post.posttext),
        ],
      ),
      Container(
        padding: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Image.network(post.postimage, fit: BoxFit.fitWidth),
        ),
      ),
    ],
  );
}

Widget pcFooter(BuildContext context, Post post) {
  return Row(
    children: <Widget>[
      SizedBox(height: 50.0, width: 30.0),
      FavoriteButton(
        valueChanged: () {},
        iconSize: 40.0,
        iconColor: Colors.purple[800],
      ),
      Text(post.numlikes.toString(), style: TextStyle(fontSize: 12)),
      SizedBox(width: 30.0),
      IconButton(
        icon: Icon(Icons.comment_outlined, color: Colors.purple[800]),
      ),
      Text(post.numcomments.toString(), style: TextStyle(fontSize: 12)),
      SizedBox(width: 140.0),
      CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.purple[800],
        child: IconButton(
          icon: Icon(Icons.share_outlined, color: Colors.white),
        ),
      ),
    ],
  );
}
