import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleDay {
  List<ScheduleEvent> events = new List<ScheduleEvent>();
  List<Activity> get activities {
    //returns list of activites automatically generated from events
    List<Activity> list = new List<Activity>();
    if (events != null) {
      list = getActivitiesFromEvents(events);
    }
    return list;
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

  ScheduleDay.todayFromStorage(LocalStorage storage) {
    this.events = getFromStorage(DateTime.now(), storage);
  }

  ScheduleDay.fromStorage(DateTime date, LocalStorage storage) {
    this.events = getFromStorage(date, storage);
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

  // final TodoList list = new TodoList();
  // final LocalStorage storage = new LocalStorage('todo_app');

  // _saveToStorage() {
  //   storage.setItem('todos', list.toJSONEncodable());
  // }
  //

  //get a list of ScheduleEvents on date from LocalStorage
  List<ScheduleEvent> getFromStorage(DateTime date, LocalStorage storage) {
    String day = date.toIso8601String();
    var list = storage.getItem(day);
    if (list != null) {
      this.events = List<ScheduleEvent>.from(
        (list as List).map(
          (item) => ScheduleEvent(
            title: item['title'],
            // description: item['description'],
            endDate: item['endDate'],
            date: item['date'],
          ),
        ),
      );
    }
    print("list is of type $list");
    return list;
  }
}
