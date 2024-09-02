import 'package:flutter/material.dart';
import 'package:myapp/data/database.dart';
import 'package:myapp/utilities/dialog_box.dart';
import 'package:myapp/utilities/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //opening the app for the first time
    if (_myBox.get("TASKLIST") == null) {
      db.initialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //Text controller
  final _controller = TextEditingController();

  //Tasks list
  /*List toDoList = [
    ["Workout", false],
    ["Study", false],
  ];*/
  //using ToDoDatabase instead

  //Checkbox function
  void checkBox(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      _controller.clear();
    });
    db.updateDatabase();
  }

//Saving tasks
  void saveNewTasks() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  //Adding tasks
  void newTasks() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTasks,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
    db.updateDatabase();
  }

  //Deleting tasks
  void deleteTask(index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        centerTitle: true,
        title: Text("TASKS TO BE COMPLETED!"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newTasks,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBox(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }
      ),
    );
  }
}
