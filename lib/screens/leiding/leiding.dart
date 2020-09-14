import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kramaai/models/leider.dart';
import 'package:kramaai/screens/leiding/card.dart';
import 'package:kramaai/shared/constants.dart';

class Leiding extends StatefulWidget {
  @override
  _LeidingState createState() => _LeidingState();
}

class _LeidingState extends State<Leiding> {

  Map<String, List<Leider>> leiding = new Map<String, List<Leider>>();

//  Get leiders and put them in a key value Map
  getLeiders() async {
    try {
      var leiders = await FirebaseFirestore.instance.collection('Leiders').get();
      if (leiders.docs.isNotEmpty) {
        var leidersList =  leiders.docs
            .map((snapshot) => Leider.fromMap(snapshot.data()))
            .toList();

        for (var i = 0; i < leidersList.length; i++) {
          var group = leidersList[i].group;
          setState(() {
            if (leiding[group] == null) {
              leiding[group] = [leidersList[i]];
            } else {
              leiding[group].add(leidersList[i]);
            }
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getLeiders();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Leiding",
//          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: kSecondaryColor,
      ),
      child: ListView.builder(
          itemCount: leiding.length,
          itemBuilder: (BuildContext context, int index) =>
              buildLeidingCard(context, index)),
    );
  }

  Widget buildLeidingCard(BuildContext context, int index) {
    String name = '';
    switch (index) {
      case 0:
        name = 'Kapoenen';
        break;
      case 1:
        name = 'Welpen';
        break;
      case 2:
        name = 'Bevers';
        break;
      case 3:
        name = 'Jong givers';
        break;
      case 4:
        name = 'Givers';
        break;
      case 5:
        name = 'Jins';
        break;
    }
    return LeidingCard(
      context: context,
      leiders: leiding[name],
      group: name,
      index: index,
    );
  }
}
