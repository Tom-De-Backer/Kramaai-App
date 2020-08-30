import 'package:kramaai/models/activity.dart';

import 'activity_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getActivities(ActivityNotifier activityNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Activities').get();

  List<Activity> _activityList = [];
  
  snapshot.docs.forEach((document) {
    Activity activity = Activity.fromMap(document.data());
    _activityList.add(activity);
  });

  activityNotifier.activityList = _activityList;
}