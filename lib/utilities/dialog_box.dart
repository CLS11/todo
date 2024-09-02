import 'package:flutter/material.dart';
import 'package:myapp/utilities/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[400],
      content: Container(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //Getting input from user
          TextField(
            controller: controller,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add a new task..",
            ),
          ),

          //Buttons for saving and cancelling
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Saving button
              Button(text: "Save", onPressed: onSave),
              //Cancel button
              Button(text: "Cancel", onPressed: onCancel),
            ],
          ),
         ],
        ),
      ),
    );
  }
}
