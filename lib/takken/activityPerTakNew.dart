import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kramaai/models/activity.dart';
import 'package:kramaai/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:kramaai/services/activity_api.dart';
import 'package:kramaai/services/activity_notifier.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class ActivityPerTakNew extends StatefulWidget {
  final String tak;

  ActivityPerTakNew({this.tak});

  @override
  _ActivityPerTakNewState createState() => _ActivityPerTakNewState();
}

class _ActivityPerTakNewState extends State<ActivityPerTakNew> {
  @override
  void initState() {
    ActivityNotifier activityNotifier =
        Provider.of<ActivityNotifier>(context, listen: false);
    getActivities(activityNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ActivityNotifier activityNotifier = Provider.of<ActivityNotifier>(context);

    print("Building Feed");

    List<Activity> filteredList = activityNotifier.activityList
        .where(
            (element) => element.tak.toLowerCase() == widget.tak.toLowerCase())
        .toList();

    return Scaffold(
      backgroundColor: kThirdColor,
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  widget.tak,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 44,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 200,
                child: Swiper(
                  itemCount: filteredList.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 40,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: 100),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 100),
                                    Text(
                                      filteredList[index].title,
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 44,
                                        color: const Color(0xff47455f),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'Solar System',
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 23,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 32),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'Know more',
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 18,
                                            color: kSecondaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Hero(
                          tag: index + 1,
                          child: Image.asset(
                              "assets/images/takken/${widget.tak.toLowerCase()}.png"),
                        ),
                        Positioned(
                          right: 24,
                          bottom: 60,
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 200,
                              color: Colors.black.withOpacity(0.08),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
