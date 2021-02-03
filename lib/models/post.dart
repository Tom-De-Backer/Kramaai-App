import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Timestamp date;
  String title;
  String text;

  Post.fromMap(Map<String, dynamic> data) {
    date = data['date'];
    title = data['title'];
    text = data['text'];
  }
}