import 'package:flutter/material.dart';
import 'package:myapp/utilities/dialog_box.dart';
import 'package:myapp/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Text controller
  final _controller = TextEditingController();

  //Tasks list
  List toDoList = [
    ["Workout", false],
    ["Study", false],
  ];

  //Checkbox function
  void checkBox(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
      _controller.clear();
    });
  }

//Saving tasks
  void saveNewTasks() {
    setState(() {
      toDoList.add([_controller.text, false]);
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
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBox(value, index),
            );
          }),
    );
  }
}
