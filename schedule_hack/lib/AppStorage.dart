import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activities.dart';
import 'package:schedule_hack/Activity.dart';

//add to classes to get local storage functions
mixin AppStorage {
  //Gets the list activites from storage  for a particular date
  Activities getActivitiesFromStorage(
      DateTime date, LocalStorage localStorage) {
    List<Activity> events =
    Activities.getActivitiesFromStorage(date, localStorage);
    Activities a = new Activities.fromActivities(date, events);
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