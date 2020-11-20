import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ScheduleEvent.dart';

//class that holds activities
class Activities {
  List<ScheduleEvent> activities = new List<ScheduleEvent>();
  DateTime date = DateTime.now();

  ////////////constructors
  Activities.test(int days) {
    this.activities = new List<ScheduleEvent>();
    activities.add(new ScheduleEvent.test("Study", 0));
  }

  Activities.fromDate(DateTime date) {
    this.activities = new List<ScheduleEvent>();
    this.date = date;
  }

  //copy another Activities object
  Activities.fromActivities(Activities activities) {
    this.activities = activities.activities;
  }

  //from list of Schedule Events (new)
  Activities.fromScheduleEvents(DateTime date, List<ScheduleEvent> events) {
    this.date = date;
    setEvents(events);
  }

  //from storage from key: today's date
  Activities.todayFromStorage(LocalStorage storage) {
    this.activities = getEventListFromStorage(DateTime.now(), storage);
    this.date = DateTime.now();
  }

  //from storage from key: date
  Activities.fromStorage(DateTime date, LocalStorage storage) {
    this.date = date;
    this.activities = getEventListFromStorage(date, storage);
  }

  //JSON encodable conversion
  toJSONEncodable() {
    return this.activities.map((event) {
      return event.toJSONEncodable();
    }).toList();
  }

  //Adds actitivies to storage with key = day.toIso8601String(), value = encoded Acitivites (i.e. List<Activity>)
  void addToLocalStorage(DateTime date, LocalStorage storage) {
    final encoded = this.toJSONEncodable();
    storage.setItem(date.toIso8601String(), encoded);
    //getting into storage and getting out of storage to make sure it worked
    List<ScheduleEvent> se = getEventListFromStorage(date, storage);
    print(
        "adding ${activities.length} events on ${DateFormat.yMEd('en_US').format(date)}");
  }

  //Removes all actitivies to storage with key = day.toIso8601String(), value = encoded Acitivites (i.e. List<Activity>)
  void removeAllFromLocalStorage(DateTime date, LocalStorage storage) {
    storage.deleteItem(date.toIso8601String());
    print(
        "removing ${activities.length} events on ${DateFormat.yMEd('en_US').format(date)}");
  }

  //TODO: void removeActivityFromLocalStorage(Activity activity, LocalStorage storage); (or something -- search through for individual activity and remove from list)

  //various getters and getters

  List<ScheduleEvent> getEvents() {
    return this.activities;
  }

  //Sets events from a List<ScheduleEvent>
  void setEvents(List<ScheduleEvent> e) {
    this.activities = e;
  }

  DateTime getDate() {
    return this.date;
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
              item['start'], item['end'], item['subject'], item['notes']),
        ),
      );
    }
    print("list ($list) is of type ${list.runtimeType}");
    return e;
  }

  static Activities getFromStorage(DateTime date, LocalStorage storage) {
    List<ScheduleEvent> events =
        Activities.getEventListFromStorage(date, storage);
    Activities a = new Activities.fromScheduleEvents(date, events);
    print("EVENTS (${events}) is of type ${events.runtimeType}");
    return a;
  }
}
