import 'package:auto_size_text/auto_size_text.dart';
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
                          // color: colorAeroBlue,
                          // borderRadius: BorderRadius.circular(22.0),
                          ),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: colorAeroBlue,
                          onPressed: () {
                            String message =
                                'Showing recommendations for self-reflection';
                            StandardPopup(context, message, 2);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: padding.left,
                                top: padding.top,
                                right: padding.right),
                            child: ListView(children: [
                              new AutoSizeText(
                                "Check-In",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: colorBlackCoral,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                minFontSize: 20,
                                textAlign: TextAlign.center,
                              ),
                              ImageIcon(
                                AssetImage("images/yoga.png"),
                                color: colorBlackCoral,
                                size: 100.0,
                              ),
                              new Text(
                                  "Click here to learn more and tune into your mental health",
                                  textAlign: TextAlign.center,
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
                          // color: colorPowderBlue,
                          // borderRadius: BorderRadius.circular(22.0),
                          ),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: colorPowderBlue,
                          onPressed: () {
                            String message =
                                'Showing recommendations for relaxation';
                            //_showMaterialDialog2(message);
                            StandardPopup(context, message, 2);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: padding.left,
                                top: padding.top,
                                right: padding.right),
                            child: ListView(children: [
                              new AutoSizeText(
                                "Check-Out",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: colorBlackCoral,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                minFontSize: 20,
                                textAlign: TextAlign.center,
                              ),
                              ImageIcon(
                                AssetImage("images/music.png"),
                                color: colorBlackCoral,
                                size: 100.0,
                              ),
                              new Text(
                                  "Click here to destress and tune out the world",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0, color: colorBlackCoral)),
                            ]),
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
