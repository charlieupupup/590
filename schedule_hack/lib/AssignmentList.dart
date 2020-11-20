import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/Activities.dart';
import 'package:schedule_hack/Assignment.dart';
import 'package:schedule_hack/ConfirmPopup.dart';
import 'package:schedule_hack/DateSelector.dart';
import 'package:schedule_hack/JsonDataStorage.dart';
import 'package:schedule_hack/ScheduleEvent.dart';
import 'package:schedule_hack/utilities.dart';
import 'Activity.dart';
import 'CancelButton.dart';
import 'Course.dart';

import 'LoadingScreen.dart';
import 'PlaceHolderWidget.dart';
import 'SettingsButton.dart';
import 'StandardPopup.dart';
import 'TimeSelector.dart';

// Class to display and interact with list of assignments
class AssignmentList extends StatefulWidget {
  Course course;
  int edit;
  int courseCount;
  int viewingAssignments; // default is that we're editing (0)
  Course originalCourse;

  AssignmentList(Course c, int e, int cCount, int vA, Course oC) {
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
    this.viewingAssignments = vA;
    this.originalCourse = oC;
  }
  AssignmentList.viewing(Course c, int e, int cCount, int vA) {
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
    this.viewingAssignments = vA;
    print('Viewing Assignments: $viewingAssignments');
  }
  @override
  State<StatefulWidget> createState() {
    return new _AssignmentListState(this.course, this.edit, this.courseCount,
        this.viewingAssignments, this.originalCourse);
  }
}

class _AssignmentListState extends State<AssignmentList> {
  TextEditingController myControllerDescription = TextEditingController();
  TextEditingController myControllerTime = TextEditingController();
  TextEditingController myControllerDate = TextEditingController();
  int edit;
  Course course;
  int courseCount;
  int _currentIndex = 2;
  int viewingAssignments; // default is that we're editing (0)
  Activities activities = new Activities.test(0);
  Course originalCourse;
  bool deleteItem = false;

  _AssignmentListState(Course c, int e, int cCount, int vA, Course oC) {
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
    this.viewingAssignments = vA;
    print('_viewingAssignments = $viewingAssignments');
    this.originalCourse = oC;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerDescription.dispose();
    myControllerTime.dispose();
    myControllerDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _emptyDialog(context));
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: colorBlackCoral,
            ),
            onPressed: () {
              // popup - saying going back will delete data
              _backButton();
            }),
        actions: [
          Row(
            children: [SettingsButton()],
          ),
        ],
        title: Text('Assignments',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: colorBlackCoral)),
        backgroundColor: colorHoneydew,
      ),
      body: Container(
          child: ListView.builder(
              itemCount: this
                  .course
                  .getAssignments
                  .length, // might need to split this up
              itemBuilder: (BuildContext context, int index) {
                // _confirmDeletePopup(index);
                return Dismissible(
                  background: deleteBackground(),
                  onDismissed: (DismissDirection direction) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Assignment deleted")));
                    setState(() {
                      List assignmentList = new List();
                      assignmentList = this.course.getAssignments;
                      assignmentList.removeAt(index);
                      Course newCourse = new Course.long(
                          this.course.getName,
                          this.course.getTime,
                          this.course.getDate,
                          this.course.getCourseDays,
                          assignmentList);
                      this.course = newCourse;
                      myControllerDate.clear();
                      myControllerTime.clear();
                      myControllerDescription.clear();
                    });
                  },
                  child: returnAssignmentButtonIndex(index),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (direction) => promptUser(direction),
                );
              }) //returnAssignmentButton(),
          ),
      bottomNavigationBar: SizedBox(
        height: 58,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: <Widget>[saveChanges()],
        ),
      ),
      floatingActionButton: _fabDisplay(),
    );
  }

  Future<bool> promptUser(DismissDirection direction) async {
    String action;
    if (direction == DismissDirection.endToStart) {
      // This is a delete action
      action = "delete";
    } else {
      //archiveItem();
      // This is an archive action
      action = "archive";
    }

    return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: colorBeige,
              elevation: 16,
              actions: <Widget>[
                Center(
                  child: Text('Are you sure you want to delete the assignment?',
                      style: TextStyle(
                          fontSize: 24,
                          color: colorBlackCoral,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
                Container(
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          // Dismiss the dialog but don't
                          // dismiss the swiped item
                          return Navigator.of(context).pop(false);
                        },
                        color: colorMelon,
                        child: Image.asset(
                          'images/delete.png',
                          height: 50,
                          width: 50,
                        ),
                        shape: CircleBorder(),
                      ),
                      MaterialButton(
                        onPressed: () {
                          // Dismiss the dialog and
                          // also dismiss the swiped item
                          Navigator.of(context).pop(true);
                        },
                        color: colorHoneydew,
                        child: Image.asset(
                          'images/checkmark.png',
                          height: 50,
                          width: 50,
                        ),
                        shape: CircleBorder(),
                      )
                    ],
                  ),
                )
              ],
            ));
  }

  // Delete Dismissible background
  Widget deleteBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  // pick between displaying edit or plus icon
  Widget _fabDisplay() {
    // viewingAssignments == 1 then coming from previously created course
    if (this.viewingAssignments == 1) {
      print('I am in viewingAssignments = 1');
      return FloatingActionButton(
        onPressed: () {
          setState(() {
            this.viewingAssignments = 0;
          });
        },
        backgroundColor: colorSoftMelon, //colorAlmond,
        child: Image.asset('images/edit.png'),
      );
    } else {
      print('I am in viewingAssignments = 0');
      return FloatingActionButton(
        onPressed: () {
          _showMaterialDialog();
        },
        backgroundColor: colorAeroBlue, //colorHoneydew,
        child: Image.asset('images/add.png'),
      );
    }
  }

  Widget saveChanges() {
    return MaterialButton(
      onPressed: () {
        // TODO: Add activityList to singleton
        // TODO: Add course activity to singleton
        JsonDataStorage jsonDataStorage = new JsonDataStorage();
        jsonDataStorage.newEntry(this.course);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => LoadingScreen()),
          (route) => false,
        );
      },
      color: colorHoneydew,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: new Text('Save Changes',
          style: TextStyle(
              fontSize: 20.0,
              color: colorBlackCoral,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget cancelA() {
    if (this.edit == 1) {
      return Column();
    } else {
      //return CancelButton.assignment(5,this.course);
      return CancelButton.assignment(2, this.course);
    }
  }

  _backButton() {
    if (this.edit == 1) {
      print('edit cancel');
      // TODO: bug where hitting back still saves data
      List list = new List();
      list = globalCourse.getAssignments;
      for (int i = 0; i < list.length; i++) {
        Assignment a = list[i];
        String assignmentName = a.getDescription;
        print('Assignment: $assignmentName');
      }
      StandardPopup.course(
          context,
          'Going back now will not save all progress. Are you sure?',
          5,
          globalCourse);
    } else {
      //return CancelButton.assignment(2, this.course);
      print('cancel should be working');
      //return CancelButton.assignment(6,this.course);
      StandardPopup.course(
          context,
          'Going back now will not save all progress. Are you sure?',
          2,
          this.originalCourse);
    }
  }

  // popup if no assignments listed yet
  _emptyDialog(BuildContext context) {
    List list = new List();
    list = this.course.getAssignments;
    if (this.viewingAssignments == 1) {
      if (list.length == 0) {
        // no assignments yet
        String message =
            "Hit the add 'edit' icon in the bottom right to edit your assignment list";
        ConfirmPopup(context, message, 8);
      } else {
        // do nothing
      }
    } else {
      if (list.length == 0) {
        // no assignments yet
        String message =
            "Hit the add '+' icon in the bottom right to add assignments to your "
            "course & calendar";
        ConfirmPopup(context, message, 8);
      } else {
        // do nothing
      }
    }
  }

  // Add new assignment popup
  _showMaterialDialog() {
    MainAxisAlignment alignment = MainAxisAlignment.end;
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              backgroundColor: colorBeige,
              elevation: 16,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              content: Container(
                height: 280,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ADD ASSIGNMENT',
                          style: TextStyle(
                              fontSize: 24,
                              color: colorBlackCoral,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      TextFormField(
                        controller: myControllerDescription,
                        decoration: InputDecoration(hintText: 'Name'),
                      ),
                      new Expanded(
                          child: DateSelector(
                              hintText: 'Due Date',
                              dateController: myControllerDate)),
                      new Expanded(
                          child: TimeSelector(
                              hintText: 'Due Time',
                              timeController: myControllerTime)),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ButtonBar(
                          alignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CancelButton(),
                            saveAssignment(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget saveAssignment() {
    return MaterialButton(
      onPressed: () {
        setState(() {
          Assignment a = new Assignment.long(myControllerDescription.text,
              myControllerDate.text, myControllerTime.text);
          this.course.setAssignments = a;
          // Making Activity.assignment
          if (myControllerDate.text.isEmpty || myControllerTime.text.isEmpty) {
            // if no date or time do nothing
          } else {
            DateTime dueDate = DateTime.parse(myControllerDate.text);
            ScheduleEvent activity = new ScheduleEvent.assignment(
                dueDate, myControllerDescription.text);

            //for each day in difference create act and add to list
            activities.activities.add(activity);
            myControllerDate.clear();
            myControllerTime.clear();
            myControllerDescription.clear();
          }
        });
        printText();
        Navigator.of(context).pop();
      },
      color: colorHoneydew,
      child: Image.asset(
        'images/checkmark.png',
        height: 50,
        width: 50,
      ),
      shape: CircleBorder(),
    );
  }

  void printText() {
    String data;
    data = myControllerDescription.text;
    String date = myControllerDate.text;
    String time = myControllerTime.text;
    print('Description: $data');
    print('Date: $date');
    print('Time: $time');
  }

  Widget returnAssignmentButton() {
    List<Widget> widgetList = new List<Widget>();
    List list = new List();
    list = this.course.getAssignments;
    if (list.length == 0) {
      return new Column();
    } else {
      for (int i = 0; i < list.length; i++) {
        Assignment a;
        a = list[i];
        String description = a.getDescription;
        widgetList.add(assignmentButton(description));
      }
      return new Column(children: widgetList);
    }
  }

  Widget returnAssignmentButtonIndex(int index) {
    List list = new List();
    list = this.course.getAssignments;
    if (list.length == 0) {
      return new Column();
    } else {
      Assignment a;
      a = list[index];
      String description = a.getDescription;
      return assignmentButton(description);
    }
  }

  // Assignment button UI
  Widget assignmentButton(String des) {
    if (this.viewingAssignments == 1) {
      // no edit button
      return new Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                color: colorPowderBlue, //colorMelon,
                onPressed: () {},
                child: Container(
                  margin: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        des,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 24, color: colorBlackCoral),
                      )),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  //width: 250,
                  //height: 50,
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return new Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                color: colorPowderBlue, //colorMelon,
                onPressed: () {},
                child: Container(
                  margin: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        des,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 24, color: colorBlackCoral),
                      )),
                      MaterialButton(
                          onPressed: () {},
                          color: colorSoftMelon, //colorAlmond,
                          child: Image.asset(
                            'images/edit.png',
                            height: 50,
                            width: 50,
                          ),
                          shape: CircleBorder())
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  //width: 250,
                  // height: 50,
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
