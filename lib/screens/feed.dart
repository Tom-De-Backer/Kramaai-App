import 'package:flutter/material.dart';
import 'package:kramaai/screens/activityDetail.dart';
import 'package:kramaai/services/activity_api.dart';
import 'package:kramaai/services/activity_notifier.dart';
import 'package:kramaai/services/auth_api.dart';
import 'package:kramaai/services/auth_notifier.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    ActivityNotifier activityNotifier = Provider.of<ActivityNotifier>(context, listen: false);
    getActivities(activityNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    ActivityNotifier activityNotifier = Provider.of<ActivityNotifier>(context);

    print("Building Feed");


    return Scaffold(
      appBar: AppBar(
        title: Text(
          authNotifier.user != null ? authNotifier.user.displayName : "Feed"
        ),
        actions: [
          FlatButton(
            onPressed: () => signout(authNotifier),
            child: Text(
              "Logout",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {

            var date = activityNotifier.activityList[index].date.toDate();
            List<String> months = [
              'jan',
              'feb',
              'maa',
              'apr',
              'mei',
              'jun',
              'jul',
              'aug',
              'sep',
              'okt',
              'nov',
              'dec'
            ];

//            TODO: Vergelijk datum met vandaag!
            if (date.isBefore(DateTime.now())) {
//              return Container();
            }


            return ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal:
              10.0),
              leading: Card(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                  child: Column(
                    children: [
                      Text(date.day.toString(),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(months[date.month - 1],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              title: Text(
                activityNotifier.activityList[index].title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                  activityNotifier.activityList[index].explanation,
                  style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                activityNotifier.currentActivity = activityNotifier.activityList[index];
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return ActivityDetail();
                  })
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
                color: Colors.black
            );
          },
          itemCount: activityNotifier.activityList.length),
    );
  }
}
