import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ScheduleEvent.dart';

class ScheduleDay {
  List<ScheduleEvent> events;
  List<Activity> get activities {
    //returns list of activites automatically generated from events
    return getActivitiesFromEvents(events);
  }

  //constructors
  ScheduleDay() {
    this.events = new List<ScheduleEvent>();
  }

  ScheduleDay.fromActivities(List<Activity> a) {
    setActivities(a);
  }

  ScheduleDay.fromScheduleEvents(List<ScheduleEvent> e) {
    setEvents(e);
  }

  ScheduleDay.fromStorage(LocalStorage storage) {
    this.events = getFromStorage(storage);
  }

  //JSON conversion
  toJSONEncodable() {
    return this.events.map((event) {
      return event.toJSONEncodable();
    }).toList();
  }

  //various getters and getters

  List<ScheduleEvent> getEvents() {
    return this.events;
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

  //get a list of ScheduleEvents from LocalStorage
  List<ScheduleEvent> getFromStorage(LocalStorage storage) {
    var list = storage.getItem('activities');
    if (list != null) {
      this.events = List<ScheduleEvent>.from(
        (list as List).map(
          (item) => ScheduleEvent(
            title: item['title'],
            description: item['description'],
            endDate: item['endDate'],
            date: item['date'],
          ),
        ),
      );
    } else {
      list = new List<ScheduleEvent>();
    }
    return list;
  }
}
