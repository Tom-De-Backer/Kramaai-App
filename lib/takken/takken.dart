import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kramaai/screens/settings/settings.dart';
import 'package:kramaai/shared/constants.dart';
import 'package:kramaai/takken/activityPerTak.dart';

class Takken extends StatelessWidget {
  final List<String> _groups = [
    "Kapoenen",
    "Welpen",
    "Bevers",
    "Jonggivers",
    "Givers",
    "Jins"
  ];

  getGroups(context) {
    return _groups
        .map((item) => InkWell(
              onTap: () {
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (BuildContext context) {
                      return Scaffold(
                        body: CupertinoPageScaffold(child: ActivityPerTak(tak: item)),
                      );
                    })
                );
              },
              child: Container(
                child: Center(
                    child: Text(
                  item,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2),
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/takken/${item.toLowerCase()}.png"),
                        fit: BoxFit.contain)),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Takken",
        ),
        backgroundColor: kSecondaryColor,
      ),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: getGroups(context),
          ),
        ),
      ),
    );
  }
}
