import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  Timestamp date;
  String tak;
  String title;
  String explanation;

  Activity.fromMap(Map<String, dynamic> data) {
    date = data['date'];
    tak = data['tak'];
    title = data['title'];
    explanation = data['explanation'];
  }
}