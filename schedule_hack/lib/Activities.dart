import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ScheduleEvent.dart';

//class that holds activities
class Activities {
  List<ScheduleEvent> events = new List<ScheduleEvent>();
  List<ActivityNew> get activities {
    //returns list of activites automatically generated from events
    List<ActivityNew> list = new List<ActivityNew>();
    if ((events != null) && events.isNotEmpty) {
      list = getActivitiesFromEvents(events);
    }
    return list;
  }

  ////////////constructors
  Activities.test() {
    this.events = new List<ScheduleEvent>();
    events.add(new ScheduleEvent.test());
  }

  Activities.fromDate(DateTime date) {
    this.events = new List<ScheduleEvent>();
  }

  //from list of Activity (new)
  Activities.fromActivityList(DateTime date, List<ActivityNew> a) {
    setActivities(a);
  }

  //copy another Activities object
  Activities.fromActivities(Activities activities) {
    this.events = activities.events;
  }

  //from list of Schedule Events (new)
  Activities.fromScheduleEvents(DateTime date, List<ScheduleEvent> events) {
    setEvents(events);
  }

  //from storage from key: today's date
  Activities.todayFromStorage(LocalStorage storage) {
    this.events = getEventListFromStorage(DateTime.now(), storage);
  }

  //from storage from key: date
  Activities.fromStorage(DateTime date, LocalStorage storage) {
    this.events = getEventListFromStorage(date, storage);
  }

  //Add individual activity to list
  void addActivity(ActivityNew activity) {
    events.add(new ScheduleEvent.fromActivityNew(activity));
  }

  //JSON encodable conversion
  toJSONEncodable() {
    return this.events.map((event) {
      return event.toJSONEncodable();
    }).toList();
  }

  //Adds actitivies to storage with key = day.toIso8601String(), value = encoded Acitivites (i.e. List<Activity>)
  void addToLocalStorage(DateTime date, LocalStorage storage) {
    final encoded = this.toJSONEncodable();
    storage.setItem(date.toIso8601String(), encoded);
    //getting into storage and getting out of storage to make sure it worked
    List<ScheduleEvent> se = getEventListFromStorage(date, storage);
    List<ActivityNew> acts = getActivitiesFromEvents(se);
    Activities a = new Activities.fromActivityList(date, acts);

    print(
        "adding ${events.length} events on ${DateFormat.yMEd('en_US').format(date)}");
    print(
        "added ${a.events.length} events on ${DateFormat.yMEd('en_US').format(date)}");
  }

  //Removes all actitivies to storage with key = day.toIso8601String(), value = encoded Acitivites (i.e. List<Activity>)
  void removeAllFromLocalStorage(DateTime date, LocalStorage storage) {
    storage.deleteItem(date.toIso8601String());
    print(
        "removing ${events.length} events on ${DateFormat.yMEd('en_US').format(date)}");
  }

  //TODO: void removeActivityFromLocalStorage(Activity activity, LocalStorage storage); (or something -- search through for individual activity and remove from list)

  //various getters and getters

  List<ScheduleEvent> getEvents() {
    return this.events;
  }

  //Sets events from a List<ScheduleEvent>
  void setEvents(List<ScheduleEvent> e) {
    this.events = e;
  }

  //Sets events from an List<Activity>
  void setActivities(List<ActivityNew> a) {
    List<ScheduleEvent> list = new List<ScheduleEvent>();
    for (int i = 0; i < a.length; i++) {
      list.add(ScheduleEvent.fromActivityNew(a[i]));
    }
    this.events = list;
  }

  //get a List<ScheduleEvent> from an List<Activity>
  static List<ScheduleEvent> getEventsFromActivities(List<ActivityNew> a) {
    List<ScheduleEvent> list = new List<ScheduleEvent>();
    for (int i = 0; i < a.length; i++) {
      list.add(ScheduleEvent.fromActivityNew(a[i]));
    }
    return list;
  }

  //get an List<Activity> from a List<ScheduleEvent>
  static List<ActivityNew> getActivitiesFromEvents(List<ScheduleEvent> e) {
    List<ActivityNew> list = new List<ActivityNew>();
    for (int i = 0; i < e.length; i++) {
      list.add(ActivityNew.fromScheduleEvent(e[i]));
    }
    return list;
  }

  //get a list of ScheduleEvents on date from LocalStorage
  static List<ScheduleEvent> getEventListFromStorage(
      DateTime date, LocalStorage storage) {
    String day = date.toIso8601String();
    List<ScheduleEvent> e = new List<ScheduleEvent>();
    var list = storage.getItem(day);
    if (list != null) {
      e = List<ScheduleEvent>.from(
        (list as List).map(
          (item) => ScheduleEvent(
            subject: item['subject'],
            startTime: item['startTime'],
            endTime: item['endTime'],
          ),
        ),
      );
    }
    print("list ($list) is of type ${list.runtimeType}");
    // print("events ($events) is of type ${events.runtimeType}");
    return e;
  }

  static Activities getFromStorage(DateTime date, LocalStorage storage) {
    List<ScheduleEvent> events =
        Activities.getEventListFromStorage(date, storage);
    Activities a = new Activities.fromScheduleEvents(date, events);
    print("EVENTS (${events}) is of type ${events.runtimeType}");

    print("ACTIVITIES (${a.events}) is of type ${a.runtimeType}");

    return a;
  }
}
