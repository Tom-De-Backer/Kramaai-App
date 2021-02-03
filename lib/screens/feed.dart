import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kramaai/services/auth_notifier.dart';
import 'package:kramaai/services/post_api.dart';
import 'package:kramaai/services/post_notifier.dart';
import 'package:kramaai/shared/constants.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    PostNotifier postNotifier = Provider.of<PostNotifier>(context, listen: false);
    getPosts(postNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    PostNotifier postNotifier = Provider.of<PostNotifier>(context);

    print("Building Feed");

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Welkom ${authNotifier.user.displayName}",
//          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: kSecondaryColor,
      ),
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal:
              10.0),
              title: Text(
                postNotifier.postList[index].title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
                color: Colors.black
            );
          },
          itemCount: postNotifier.postList.length),
    );
  }
}
