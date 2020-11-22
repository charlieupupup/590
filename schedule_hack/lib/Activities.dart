import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activity.dart';

//class that holds activities
class Activities {
  List<Activity> activities = new List<Activity>();
  DateTime date = DateTime.now();

  ////////////constructors
  Activities.test(int days) {
    this.activities = new List<Activity>();
    activities.add(new Activity.test("Study", 0));
  }

  Activities.fromDate(DateTime date) {
    this.activities = new List<Activity>();
    this.date = date;
  }

  //from list of Schedule Events (new)
  Activities.fromActivities(DateTime date, List<Activity> events) {
    this.date = date;
    setActivities(events);
  }

  //from storage from key: today's date
  Activities.todayFromStorage(LocalStorage storage) {
    this.activities = getActivitiesFromStorage(DateTime.now(), storage);
    this.date = DateTime.now();
  }

  //from storage from key: date
  Activities.fromStorage(DateTime date, LocalStorage storage) {
    this.date = date;
    this.activities = getActivitiesFromStorage(date, storage);
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
    List<Activity> se = getActivitiesFromStorage(date, storage);
    // print(
    //     "adding ${se.length} events on ${DateFormat.yMEd('en_US').format(date)}");
  }

  //Removes all actitivies to storage with key = day.toIso8601String(), value = encoded Acitivites (i.e. List<Activity>)
  void removeAllFromLocalStorage(DateTime date, LocalStorage storage) {
    storage.deleteItem(date.toIso8601String());
    // print(
    //     "removing ${activities.length} events on ${DateFormat.yMEd('en_US').format(date)}");
  }

  //TODO: void removeActivityFromLocalStorage(Activity activity, LocalStorage storage); (or something -- search through for individual activity and remove from list)

  //various getters and getters

  List<Activity> getActivities() {
    return this.activities;
  }

  void setActivities(List<Activity> a) {
    this.activities = a;
  }

  DateTime getDate() {
    return this.date;
  }

  //get a list of ScheduleEvents on date from LocalStorage
  static List<Activity> getActivitiesFromStorage(
      DateTime date, LocalStorage storage) {
    String day = date.toIso8601String();
    List<Activity> e = new List<Activity>();
    var list = storage.getItem(day);
    if (list != null) {
      e = List<Activity>.from(
        (list as List).map(
          (item) => Activity(
              item['start'], item['end'], item['subject'], item['notes']),
        ),
      );
    }
    // print("list ($list) is of type ${list.runtimeType}");
    return e;
  }

  static Activities getFromStorage(DateTime date, LocalStorage storage) {
    List<Activity> events = Activities.getActivitiesFromStorage(date, storage);
    Activities a = new Activities.fromActivities(date, events);
    // print("ACTIVITIES (${events}) is of type ${events.runtimeType}");
    return a;
  }

  void printActivities() {
    String _print = "${DateFormat.yMMMd('en_US').format(date)}: (";
    for (int i = 0; i < activities.length; i++) {
      _print += activities[i].subject + ", ";
    }
    _print += ")";
    print(_print);
  }

  List<Activity> removeActivityFromLocalStorage(
      Activity activityToRemove, LocalStorage storage) {
    // print(
    //     "storage before ${Activities.getActivitiesFromStorage(activityToRemove.startTime, storage)}");
    this.printActivities();
    removeAllFromLocalStorage(activityToRemove.startTime, storage);
    // print(
    //     "storage after removal ${Activities.getActivitiesFromStorage(activityToRemove.startTime, storage)}");
    this.activities.remove(activityToRemove);
    this.printActivities();
    this.addToLocalStorage(activityToRemove.startTime, storage);
    this.printActivities();
    // print(
    //     "storage once added back ${Activities.getActivitiesFromStorage(activityToRemove.startTime, storage)}");
    return this.activities;
  }
}
