import 'package:flutter/material.dart';
import 'package:kramaai/services/activity_notifier.dart';
import 'package:provider/provider.dart';

class ActivityDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ActivityNotifier activityNotifier = Provider.of<ActivityNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          title: Text(activityNotifier.currentActivity.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Image.network("https://www.kramaai.be/static/media/Bullingen2019-1.832db5e7.jpg"),
              SizedBox(height: 32,),
              Text(activityNotifier.currentActivity.title,
                style: TextStyle(fontSize: 40,),
              ),
              SizedBox(height: 20,),
              Text(
                  activityNotifier.currentActivity.explanation,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
