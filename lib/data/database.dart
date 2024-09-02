import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  //referencing the box
  final _myBox = Hive.box('myBox');
  //opening the app for the first time
  void initialData() {
    toDoList = [
      ["Workout", false],
      ["Study", false],
    ];
  }

  //Loading the data from database
  void loadData() {
    toDoList = _myBox.get("TASKLIST");
  }

  //updating the database
  void updateDatabase() {
    _myBox.put("TASKLIST", toDoList);
  }
}
