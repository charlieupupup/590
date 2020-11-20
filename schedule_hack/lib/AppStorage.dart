import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activities.dart';
import 'package:schedule_hack/Activity.dart';
import 'package:schedule_hack/ScheduleEvent.dart';

//add to classes to get local storage functions
mixin AppStorage {
  //Gets the list activites from storage  for a particular date
  Activities getActivitiesFromStorage(
      DateTime date, LocalStorage localStorage) {
    List<ScheduleEvent> se =
        Activities.getEventListFromStorage(date, localStorage);
    List<ActivityNew> acts = Activities.getActivitiesFromEvents(se);
    Activities a = new Activities.fromActivityList(date, acts);
    return a;
  }

  //Adds Activities to local storage and returns
  void addActivitiesToStorage(
      DateTime date, LocalStorage localStorage, Activities activities) {
    activities.addToLocalStorage(date, localStorage);
    // return activities;
  }

  //removes all Activites from date
  void removeActivitiesFromStorage(
      DateTime date, LocalStorage localStorage, Activities activities) {
    activities.removeAllFromLocalStorage(date, localStorage);
  }
}
