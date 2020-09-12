import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kramaai/models/leider.dart';
import 'package:kramaai/screens/leiding/card.dart';
import 'package:kramaai/shared/constants.dart';

class Leiding extends StatelessWidget {
  final Map<String, List<Leider>> leiding = {
    'Kapoenen': [
      Leider('Karo', '+32 474 40 29 10'),
      Leider('Tom', '+32 474 40 29 12'),
      Leider('Inne', '+32 474 40 29 12'),
      Leider('Lorraine', '+32 474 40 29 12'),
      Leider('Matisse', '+32 474 40 29 12')
    ],
    'Welpen': [
      Leider('Joke Clynhens', '+32 474 40 29 10'),
      Leider('Chloe', '+32 474 40 29 12'),
      Leider('Mats', '+32 474 40 29 12'),
      Leider('Gilles', '+32 474 40 29 12'),
      Leider('Joke Van Houcke', '+32 474 40 29 12')
    ],
    'Bevers': [
      Leider('Frederic', '+32 474 40 29 10'),
      Leider('Anse', '+32 474 40 29 12'),
      Leider('Manse', '+32 474 40 29 12'),
      Leider('David', '+32 474 40 29 12'),
      Leider('Bram', '+32 474 40 29 12')
    ],
    'Jong-Givers': [
      Leider('Liesa', '+32 474 40 29 10'),
      Leider('Daan', '+32 474 40 29 12'),
      Leider('Hanne', '+32 474 40 29 12'),
      Leider('Arthur', '+32 474 40 29 12'),
    ],
    'Givers': [
      Leider('Amber', '+32 474 40 29 10'),
      Leider('Anke', '+32 474 40 29 12'),
      Leider('Lennart', '+32 474 40 29 12'),
    ],
    'Jins': [
      Leider('Hannah', '+32 474 40 29 10'),
      Leider('Sander', '+32 474 40 29 12'),
      Leider('Thomas', '+32 474 40 29 12'),
    ],
  };

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
        name = 'Jong-Givers';
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
