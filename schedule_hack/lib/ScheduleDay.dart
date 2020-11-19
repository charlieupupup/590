import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleDay {
  DateTime day = DateTime.now();
  List<ScheduleEvent> events = new List<ScheduleEvent>();
  List<Activity> get activities {
    //returns list of activites automatically generated from events
    List<Activity> list = new List<Activity>();
    if ((events != null) && events.isNotEmpty) {
      list = getActivitiesFromEvents(events);
    }
    return list;
  }

  //constructors
  ScheduleDay.test() {
    this.day = DateTime.now();
    this.events = new List<ScheduleEvent>();
    events.add(new ScheduleEvent.test());
  }

  ScheduleDay.day(DateTime date) {
    this.day = date;
    this.events = new List<ScheduleEvent>();
  }

  ScheduleDay.fromActivities(DateTime date, List<Activity> a) {
    this.day = date;
    setActivities(a);
  }

  ScheduleDay.fromScheduleEvents(DateTime date, List<ScheduleEvent> e) {
    this.day = date;
    setEvents(e);
  }

  ScheduleDay.todayFromStorage(LocalStorage storage) {
    this.day = DateTime.now();
    this.events = getFromStorage(DateTime.now(), storage);
  }

  ScheduleDay.fromStorage(DateTime date, LocalStorage storage) {
    this.day = date;
    this.events = getFromStorage(date, storage);
  }

  void addActivity(Activity activity) {
    events.add(new ScheduleEvent.fromActivity(activity));
  }

  //JSON conversion
  toJSONEncodable() {
    return this.events.map((event) {
      return event.toJSONEncodable();
    }).toList();
  }

  void addToLocalStorage(LocalStorage storage) {
    final encoded = this.toJSONEncodable();
    storage.setItem(day.toIso8601String(), encoded);
    print(
        "adding ${events.length} events on ${DateFormat.yMEd('en_US').format(day)}");
  }

  void removeFromLocalStorage(LocalStorage storage) {
    storage.deleteItem(day.toIso8601String());
    print(
        "removing ${events.length} events on ${DateFormat.yMEd('en_US').format(day)}");
  }

  //various getters and getters

  List<ScheduleEvent> getEvents() {
    return this.events;
  }

  DateTime getDay() {
    return this.day;
  }

  //Sets events from a List<ScheduleEvent>
  void setEvents(List<ScheduleEvent> e) {
    this.events = e;
  }

  //Sets events from an List<Activity>
  void setActivities(List<Activity> a) {
    List<ScheduleEvent> list = new List<ScheduleEvent>();
    for (int i = 0; i < a.length; i++) {
      list.add(ScheduleEvent.fromActivity(a[i]));
    }
    this.events = list;
  }

  //get a List<ScheduleEvent> from an List<Activity>
  List<ScheduleEvent> getEventsFromActivities(List<Activity> a) {
    List<ScheduleEvent> list = new List<ScheduleEvent>();
    for (int i = 0; i < a.length; i++) {
      list.add(ScheduleEvent.fromActivity(a[i]));
    }
    return list;
  }

  //get an List<Activity> from a List<ScheduleEvent>
  List<Activity> getActivitiesFromEvents(List<ScheduleEvent> e) {
    List<Activity> list = new List<Activity>();
    for (int i = 0; i < e.length; i++) {
      list.add(Activity.fromScheduleEvent(e[i]));
    }
    return list;
  }

  //get a list of ScheduleEvents on date from LocalStorage
  List<ScheduleEvent> getFromStorage(DateTime date, LocalStorage storage) {
    String day = date.toIso8601String();
    List<ScheduleEvent> e = new List<ScheduleEvent>();
    var list = storage.getItem(day);
    if (list != null) {
      e = List<ScheduleEvent>.from(
        (list as List).map(
          (item) => ScheduleEvent(
            title: item['title'],
            date: item['date'],
            endDate: item['endDate'],
          ),
        ),
      );
    }
    print("list ($list) is of type ${list.runtimeType}");
    print("events ($events) is of type ${events.runtimeType}");
    return e;
  }
}
