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

    print("Building ActivityPerTakNew");

    List<String> months = [
      'januari',
      'februari',
      'maart',
      'april',
      'mei',
      'juni',
      'juli',
      'augustus',
      'september',
      'oktober',
      'november',
      'december'
    ];

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
                height: 600,
//                padding: const EdgeInsets.only(left:0),
                child: Swiper(
                  itemCount: filteredList.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 40,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 15,
                      space: 8,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, PageRouteBuilder());
                      },
                      child: Stack(
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
                                      SizedBox(height: 60),
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
                                      SizedBox(height: 10),
                                      Text(
                                        months[filteredList[index].date.toDate().month - 1],
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 23,
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 120),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Meer info ',
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
                                            color: kSecondaryColor,
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
                            tag: widget.tak,
                            child: Image.asset(
                                "assets/images/takken/${widget.tak.toLowerCase().replaceAll(new RegExp(r'[^\w\s]+'),'')}.png",
                                height: 200,
                            ),
                          ),
                          Positioned(
                            right: 24,
                            bottom: 60,
                            child: Text(
                              filteredList[index].date.toDate().day.toString(),
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
                      ),
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
