import 'package:flutter/material.dart';
import 'package:schedule_hack/AppStorage.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/Notify.dart';
import 'package:schedule_hack/SelfCareBanner.dart';
import 'package:schedule_hack/SettingsButton.dart';
import 'package:schedule_hack/StandardPopup.dart';
import 'package:schedule_hack/utilities.dart';

class SelfCare extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SelfCareState();
  }
}

class SelfCareState extends State<SelfCare> with AppStorage {
  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double width =
        MediaQuery.of(context).size.width - padding.left - padding.right;
    double height =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: colorBlackCoral,
              ),
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(0),
                  ),
                );
              }),
          actions: [
            Row(
              children: [
                SettingsButton(),
                IconButton(
                  icon: Icon(
                    Icons.alarm,
                    color: colorBlackCoral,
                  ),
                  onPressed: () {
                    Notify n = Notify();
                    n.ini(context);
                    n.notify();
                  },
                )
              ],
            ),
          ],
          title: Text('Self Care',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: colorBlackCoral)),
          backgroundColor: colorHoneydew,
        ),
        body: Container(
          child: ListView(
            children: [
              CarouselBanner(context),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (width * 0.90) / 2,
                    height: height / 2,
                    color: Colors.transparent,
                    margin: EdgeInsets.all(6.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorAeroBlue,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: colorAeroBlue,
                          onPressed: () {
                            // cal.getActivities(DateTime.now());
                            String message =
                                'Showing recommendations for things to do to center yourself';
                            //_showMaterialDialog2(message);
                            StandardPopup(context, message, 2);
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 10, top: 50, right: 10),
                            child: ListView(children: [
                              new Text("Check-In",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.0, color: colorBlackCoral)),
                              ImageIcon(
                                AssetImage("images/relax.png"),
                                color: colorBlackCoral,
                                size: 75.0,
                              ),
                              new Text(
                                  "Click for methods to recenter yourself and tune into your mental health",
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0, color: colorBlackCoral)),
                            ]),
                          )),
                    ),
                  ),
                  Container(
                    width: (width * 0.90) / 2,
                    height: height / 2,
                    color: Colors.transparent,
                    margin: EdgeInsets.all(6.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorPowderBlue,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: colorPowderBlue,
                          onPressed: () {
                            String message =
                                'Showing recommendations for things to do to escape';
                            //_showMaterialDialog2(message);
                            StandardPopup(context, message, 2);
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 10, top: 50, right: 10),
                            child: ListView(children: [
                              new Text("Check-Out",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.0, color: colorBlackCoral)),
                              ImageIcon(
                                AssetImage("images/checkout.png"),
                                color: colorBlackCoral,
                                size: 75.0,
                              ),
                              new Text(
                                  "Click for methods to decompress and relax",
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0, color: colorBlackCoral)),
                            ]),
                          )),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
