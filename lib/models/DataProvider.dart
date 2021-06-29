import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:circle/controllers/PostCtrl.dart';

import 'package:circle/models/PostModel.dart';

class DataProvider extends ChangeNotifier {
  Posts newsFeed;

  Future<bool> loadNewsFeed() async {
    try {
      this.newsFeed = await getPosts();
      return true;
    } catch (err) {
      return false;
    }
  }

  void aNewPost(Post post) {
    this.newsFeed.postList.add(post);
    notifyListeners();
  }

  void addPost(Map json) {
    print('i made it here');
    createPostWithImage(json);
    notifyListeners();
  }
}
