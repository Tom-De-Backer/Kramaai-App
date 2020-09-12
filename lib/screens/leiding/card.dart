import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:kramaai/shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kramaai/models/leider.dart';

class LeidingCard extends StatefulWidget {
  final int index;
  final String group;
  final List<Leider> leiders;
  final BuildContext context;

  LeidingCard({
    Key key,
    @required this.group,
    @required this.index,
    @required this.leiders,
    @required this.context,
  }) : super(key: key);

  @override
  _LeidingCardState createState() => _LeidingCardState();
}

class _LeidingCardState extends State<LeidingCard> {
  @override
  Widget build(BuildContext context) {
    List<Leider> leiders = this.widget.leiders;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          color: kPrimaryColor,
          child: Center(
            child: Text(
              this.widget.group,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
        for (var i = 0; i < this.widget.leiders.length; i++)
          buildOneLeidingCard(
              context, leiders[i].name, leiders[i].cellphone, leiders[i].email),
      ],
    );
  }
}

buildOneLeidingCard(
    BuildContext context, String name, String cellphone, String email) {
  return Card(
    child: Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 130,
            padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: FadeInImage(
                placeholder: AssetImage('./assets/images/account.png'),
                image: NetworkImage(
                    'https://kramaai.be/images/leiders/${name.replaceAll(new RegExp(r"\s+"), "").toLowerCase()}.jpg'),
              ),
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              FlatButton(
                child: Text(
                  cellphone,
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ),
                onPressed: () => launch("tel:" + cellphone),
              ),
              SizedBox(
                height: 5,
              ),
              FlatButton(
                child: Text(
                  email,
                  style: TextStyle(fontSize: 14),
                ),
                onPressed: () => launch("mailto:" + email),
              )
            ],
          ),
          Spacer()
        ],
      ),
    ),
  );
}
