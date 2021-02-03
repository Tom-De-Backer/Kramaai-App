import 'package:kramaai/models/post.dart';

import 'post_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getPosts(PostNotifier postNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Posts').get();

  List<Post> _postList = [];

  snapshot.docs.forEach((document) {
    Post post = Post.fromMap(document.data());
    _postList.add(post);
  });

  postNotifier.postList = _postList;
}