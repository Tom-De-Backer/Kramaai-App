import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class LeidingCard extends StatefulWidget {
  final int index;
  final String group;
  final List<String> names;
  final BuildContext context;
  var dummyPicture;

  LeidingCard({
    Key key,
    @required this.group,
    @required this.index,
    @required this.names,
    @required this.context,
  }) : super(key: key);

  @override
  _LeidingCardState createState() => _LeidingCardState();
}

class _LeidingCardState extends State<LeidingCard> {
  get dummyPicture => null;
  set dummyPicture(ByteData dummyPicture) {}

  @override
  void initState() {
    rootBundle
        .load('assets/images/account.png')
        .then((data) => setState(() => print(data)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(dummyPicture);
    return Column(
      children: [
        Text(
          this.widget.group,
          style: TextStyle(fontSize: 30),
        ),
        for (var i = 0; i < this.widget.names.length; i++)
          buildOneLeidingCard(context, this.widget.names[i], dummyPicture),
      ],
    );
  }
}

buildOneLeidingCard(BuildContext context, String name, dummyPicture) {
  return Card(
    child: Row(
      children: [
        Container(
          width: 150,
          padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: FadeInImage(
              placeholder: AssetImage('./assets/images/account.png'),
              image: NetworkImage(
                  'https://media-exp1.licdn.com/dms/image/C4D03AQEIrc53iSHLbw/profile-displayphoto-shrink_200_200/0?e=1605139200&v=beta&t=jydg6MFQzr7_YyotN14UR9DVfmb3TPfiQQC9vIjcKt0'),
            ),
          ),
        ),
        Spacer(),
        Text(name),
      ],
    ),
  );
}
