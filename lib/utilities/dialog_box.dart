import 'package:flutter/material.dart';
import 'package:myapp/utilities/buttons.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[400],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //Getting input from user
          TextField(
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
              Button(text: "Save", onPressed: () {}),
              //Cancel button
              Button(text: "Cancel", onPressed: () {}),
            ],
          ),
        ]),
      ),
    );
  }
}
