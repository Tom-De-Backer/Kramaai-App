import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:kramaai/models/post.dart';

class PostNotifier with ChangeNotifier {
  List<Post> _postList = [];

  UnmodifiableListView<Post> get postList => UnmodifiableListView(_postList);

  set postList(List<Post> postList) {
    _postList = postList;
    notifyListeners();
  }
}