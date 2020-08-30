import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:kramaai/models/activity.dart';

class ActivityNotifier with ChangeNotifier {
  List<Activity> _foodList = [];
  Activity _currentActivity;

  UnmodifiableListView<Activity> get activityList => UnmodifiableListView(activityList);

  Activity get currentActivity => _currentActivity;

  set foodList(List<Activity> foodList) {
    _foodList = foodList;
    notifyListeners();
  }

}