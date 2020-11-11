import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/Assignment.dart';
import 'package:schedule_hack/ConfirmPopup.dart';
import 'package:schedule_hack/utilities.dart';
import 'CancelButton.dart';
import 'Course.dart';

import 'PlaceHolderWidget.dart';
import 'SettingsButton.dart';

// Class to display and interact with list of assignments
class AssignmentList extends StatefulWidget{
  Course course;
  int edit;
  int courseCount;
  int viewingAssignments; // default is that we're editing (0)

  AssignmentList(Course c,int e,int cCount, int vA){
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
    this.viewingAssignments = vA;
  }
  AssignmentList.viewing(Course c,int e,int cCount,int vA){
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
    this.viewingAssignments = vA;
    print('Viewing Assignments: $viewingAssignments');
  }
  @override
  State<StatefulWidget> createState() {
    return new _AssignmentListState(this.course,this.edit,this.courseCount,this.viewingAssignments);
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

  _AssignmentListState(Course c, int e,int cCount, int vA){
    this.course = c;
    this.edit = e;
    this.courseCount = cCount;
    this.viewingAssignments = vA;
    print('_viewingAssignments = $viewingAssignments');
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
        leading: Icon(
          Icons.arrow_back_ios,
          color: colorBlackCoral,
        ),
        actions: [
          Row(
            children: [
              SettingsButton()
            ],
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
        child: returnAssignmentButton(),
      ),
      bottomNavigationBar: SizedBox(
        height: 58,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            cancelA(),
            //CheckmarkButton.assignment(4, this.course,this.edit,this.courseCount)
            saveChanges()
          ],
        ),
    ),
      floatingActionButton: _fabDisplay(),
    );
  }
  // pick between displaying edit or plus icon
  Widget _fabDisplay(){
    // viewingAssignments == 1 then coming from previously created course
    if (this.viewingAssignments == 1) {
      print('I am in viewingAssignments = 1');
      return FloatingActionButton(
        onPressed: (){
          setState(() {
            this.viewingAssignments = 0;
          });
        },
        backgroundColor: colorAlmond,
        child: Image.asset('images/edit.png'),
      );
    } else {
      print('I am in viewingAssignments = 0');
      return FloatingActionButton(
        onPressed: (){
          _showMaterialDialog();
        },
        backgroundColor: colorHoneydew,
        child: Image.asset('images/add.png'),
      );
    }
  }

  Widget saveChanges(){
    return MaterialButton(
      onPressed: () {
        ConfirmPopup.course(context,'Great, your assignments will be saved. We are working in the '
            'background to build your schedule. You can always edit a course later.',5,this.course,this.edit);
      },
      color: colorHoneydew,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: new Text('Save Changes',
          style: TextStyle(
              fontSize: 20.0,
              color: colorBlackCoral,
              fontWeight: FontWeight.bold)
      ),
    );
  }
  Widget cancelA(){
    if (this.edit == 1){
      return Column();
    } else {
      //return CancelButton.assignment(5,this.course);
      return CancelButton.assignment(2,this.course);
    }
  }

  // popup if no assignments listed yet
  _emptyDialog(BuildContext context){
    List list = new List();
    list = this.course.getAssignments;
    if (this.viewingAssignments == 1){
      if (list.length == 0){
        // no assignments yet
        String message = "Hit the add 'edit' icon in the bottom right to edit your assignment list";
        ConfirmPopup(context,message,8);
      } else {
        // do nothing
      }
    } else {
      if (list.length == 0){
        // no assignments yet
        String message = "Hit the add '+' icon in the bottom right to add assignments to your "
            "course & calendar";
        ConfirmPopup(context,message,8);
      } else {
        // do nothing
      }
    }
  }
  // Add new assignment popup
  _showMaterialDialog(){
    MainAxisAlignment alignment = MainAxisAlignment.end;
    showDialog(context: context,
        builder: (_) => new AlertDialog(
          elevation: 16,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          content: Container(
            height: 280,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'ADD ASSIGNMENT',
                      style: TextStyle(fontSize: 24, color: colorBlackCoral, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center
                  ),
                  TextFormField(
                    controller: myControllerDescription,
                    decoration: InputDecoration(
                        hintText: 'Name'
                    ),
                  ),
                  TextFormField(
                    controller: myControllerDate,
                    decoration: InputDecoration(
                        hintText: 'Due Date'
                    ),
                  ),
                  TextFormField(
                    controller: myControllerTime,
                    decoration: InputDecoration(
                        hintText: 'Due Time'
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0
                    ),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CancelButton(),
                        saveAssignment(),
                        //CheckmarkButton.course(0,myController)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
  Widget saveAssignment(){
    return MaterialButton(
      onPressed: (){
        setState(() {
          Assignment a = new Assignment.long(myControllerDescription.text, myControllerDate.text, myControllerTime.text);
          this.course.setAssignments = a;
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
  void printText(){
    String data;
    data = myControllerDescription.text;
    String date = myControllerDate.text;
    String time = myControllerTime.text;
    print('Description: $data');
    print('Date: $date');
    print('Time: $time');
  }

  Widget returnAssignmentButton(){
    List<Widget> widgetList = new List<Widget>();
    List list = new List();
    list = this.course.getAssignments;
   if (list.length == 0){
     return new Column();
   } else {
       for (int i = 0; i < list.length; i++){
         Assignment a;
      //   if (this.edit == 1){
      //     a = Assignment.fromJson(list[i]);
        // } else {
           a = list[i];
        // }
         String description = a.getDescription;
         widgetList.add(assignmentButton(description));
       }
     return new Column(children: widgetList);
   }
    //return new Column(children: widgetList);
  }
  // Assignment button UI
Widget assignmentButton(String des){
  return new Center(
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: colorMelon,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PlaceholderWidget(colorPowderBlue)));
            },
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
                      onPressed: () {
                      },
                      color: colorAlmond,
                      child: Image.asset(
                        'images/edit.png',
                        height: 50,
                        width: 50,
                      ),
                      shape: CircleBorder())
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              width: 250,
              height: 50,
            ),
          ),
        )
      ],
    ),
  );
}
}