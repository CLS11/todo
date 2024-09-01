import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile(
    {super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right:30.0, top:30.0),
      child: Container(
          padding: EdgeInsets.all(25.0),
          child: Row(children: [
            //checkbox
            Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
              activeColor: Colors.black,
              ),
            //tasks to be done
            Text(
              taskName,
              style: TextStyle(
                decoration: taskCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
                ),
              ),
          ]),
          decoration: BoxDecoration(
            color: Colors.deepPurple[200],
            borderRadius: BorderRadius.circular(15.0),
          )),
    );
  }
}
