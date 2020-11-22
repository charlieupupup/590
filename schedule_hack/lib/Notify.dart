import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:schedule_hack/Home.dart';
import 'package:schedule_hack/PopUp.dart';
import 'main.dart';

class Notify extends StatelessWidget {
  final BehaviorSubject<String> selectNotificationSubject =
      BehaviorSubject<String>();
  FlutterLocalNotificationsPlugin fltrNotification =
      new FlutterLocalNotificationsPlugin();

  BuildContext context;

  void init(FlutterLocalNotificationsPlugin fltrNotification) {
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(
        android: androidInitilize, iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: ' + payload);
      }
      // selectNotificationSubject.add(payload);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomeNoti(0)),
      // );
      // showDialog(context: context, builder: (_) => MidPopUp());
      MyApp.navigatorKey.currentState.push(MaterialPageRoute(
          builder: (context) => HomeNoti(
                0,
              )));
    });
  }

  Future<void> _show(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'ScheduleHack', 'ScheduleHack', 'ScheduleHack',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'ScheduleHack',
        'Midterm completed! How do you feel?', platformChannelSpecifics,
        payload: 'ScheduleHack');
  }

  Future<void> turnOffNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> turnOffNotificationById(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      num id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> _showPeriodically(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      RepeatInterval interval) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'ScheduleHack', 'ScheduleHack', 'ScheduleHack',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        'ScheduleHack',
        'Midterm completed! How do you feel?',
        interval,
        platformChannelSpecifics,
        payload: 'ScheduleHack');
  }

  void requestIOSPermissions(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future _showFuture(FlutterLocalNotificationsPlugin fltrNotification,
      String _selectedParam, int val) async {
    print('Waiting for notification');
    var androidDetails = new AndroidNotificationDetails(
        "ScheduleHack", "ScheduleHack", "ScheduleHack",
        importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iSODetails);

    var scheduledTime;
    if (_selectedParam == "Hour") {
      scheduledTime = DateTime.now().add(Duration(hours: val));
    } else if (_selectedParam == "Minute") {
      scheduledTime = DateTime.now().add(Duration(minutes: val));
    } else {
      scheduledTime = DateTime.now().add(Duration(seconds: val));
    }

    fltrNotification.schedule(
        1,
        "ScheduleHack",
        'Midterm completed! How do you feel?',
        scheduledTime,
        generalNotificationDetails);
  }

  void ini(BuildContext context) {
    init(fltrNotification);
    this.context = context;
  }

  Future<void> notify() async {
    // _show(fltrNotification);
    _showFuture(fltrNotification, 'Minute', 1);
    // _showPeriodically(fltrNotification, RepeatInterval.hourly);
  }

  @override
  Widget build(BuildContext context) {
    this.ini(context);
    // throw UnimplementedError();
  }
}
