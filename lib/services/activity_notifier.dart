import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:kramaai/models/activity.dart';

class ActivityNotifier with ChangeNotifier {
  List<Activity> _activityList = [];
  Activity _currentActivity;

  UnmodifiableListView<Activity> get activityList => UnmodifiableListView(_activityList);

  Activity get currentActivity => _currentActivity;

  set activityList(List<Activity> activityList) {
    _activityList = activityList;
    notifyListeners();
  }

  set currentActivity(Activity activity) {
    _currentActivity = activity;
    notifyListeners();
  }

}