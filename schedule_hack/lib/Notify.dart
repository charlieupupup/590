import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notify {
  void init(FlutterLocalNotificationsPlugin fltrNotification) {
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(
        android: androidInitilize, iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings);
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

  Future _showFuture(FlutterLocalNotificationsPlugin fltrNotification,
      String _selectedParam, int val, String task) async {
    var androidDetails = new AndroidNotificationDetails(
        "ScheduleHack", "ScheduleHack", "ScheduleHack",
        importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iSODetails);

    await fltrNotification.show(0, "ScheduleHack",
        "Midterm completed! How do you feel?", generalNotificationDetails,
        payload: "ScheduleHack");
    // var scheduledTime;
    // if (_selectedParam == "Hour") {
    //   scheduledTime = DateTime.now().add(Duration(hours: val));
    // } else if (_selectedParam == "Minute") {
    //   scheduledTime = DateTime.now().add(Duration(minutes: val));
    // } else {
    //   scheduledTime = DateTime.now().add(Duration(seconds: val));
    // }

    // fltrNotification.schedule(
    //     1, "Times Uppp", task, scheduledTime, generalNotificationDetails);
  }

  Future<void> notify() async {
    FlutterLocalNotificationsPlugin fltrNotification =
        new FlutterLocalNotificationsPlugin();
    init(fltrNotification);
    // _showFuture(fltrNotification, '', 5, 'time up');
    _show(fltrNotification);
  }
}
