import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kramaai/screens/leiding/card.dart';

class Leiding extends StatelessWidget {

  final Map<String, List<String>> leiding = {
    'Kapoenen': ['Karo', 'Tom', 'Lorraine', 'Matisse', 'Inne'],
    'Welpen': ['Joke Clynhens', 'Chloe', 'Mats', 'Gilles', 'Joke Van Houcke'],
    'Bevers': ['Frederic', 'Anse', 'Manse', 'David'],
    'Jong-Givers': ['Liesa', 'Daan', 'Hanne', 'Arthur'],
    'Givers': ['Amber', 'Lennart', 'Anke'],
    'Jins': ['Sander', 'Hannah', 'Thomas'],
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: ListView.builder(
        itemCount: leiding.length,
        itemBuilder: (BuildContext context, int index) => buildLeidingCard(context, index)
      ),
    );
  }

  Widget  buildLeidingCard(BuildContext context, int index) {
    String name = '';
    switch(index){
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
      names: leiding[name],
      group: name,
      index: index,
    );
  }

}
