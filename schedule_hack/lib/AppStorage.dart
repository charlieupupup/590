import 'package:localstorage/localstorage.dart';
import 'package:schedule_hack/Activities.dart';

mixin AppStorage implements LocalStorage {
  //Gets the list activites from storage  for a particular date
  Activities getActivitiesFromDate(DateTime date) {
    return Activities.fromStorage(date, this);
  }

  //Adds Activities to local calendar and returns that list of activities
  Activities addActivitiesToStorage(DateTime date, Activities a) {
    a.addToLocalStorage(this);
    return a;
  }

  //removes all Activites from date
  void removeActivities(DateTime date, Activities a) {
    a.removeAllFromLocalStorage(this);
  }
}
