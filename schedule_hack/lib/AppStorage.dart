import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activities.dart';

//add to classes to get local storage functions
mixin AppStorage {
  //Gets the list activites from storage  for a particular date
  Activities getActivitiesFromStorage(
      LocalStorage localStorage, DateTime date) {
    return Activities.fromStorage(date, localStorage);
  }

  //Adds Activities to local storage and returns
  Activities addActivitiesToStorage(
      LocalStorage localStorage, Activities activities) {
    activities.addToLocalStorage(localStorage);
    return activities;
  }

  //removes all Activites from date
  void removeActivitiesFromStorage(
      LocalStorage localStorage, Activities activities) {
    activities.removeAllFromLocalStorage(localStorage);
  }
}
