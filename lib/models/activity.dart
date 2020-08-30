import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  Timestamp date;
  String title;
  String explanation;

  Activity.fromMap(Map<String, dynamic> data) {
    date = data['date'];
    title = data['title'];
    explanation = data['explanation'];
  }
}