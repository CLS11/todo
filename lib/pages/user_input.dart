import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  //text editor to get the access to view what user has entered
  TextEditingController Controller = TextEditingController();

  //Message to be displayed
  String greetmessage = "";

  //function to greet the user
  void greetUser() {
    setState(() {
      greetmessage = "Hey, " + Controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      //greeting user
                      Text(greetmessage),
                      //text field to get input from user
                      TextField(
                          controller: Controller,
                          decoration:
                              InputDecoration(border: OutlineInputBorder(),
                              hintText: "Enter your name..")),
                      //button
                      ElevatedButton(
                        onPressed: greetUser,
                        child: Text("Tap here!"),
                      ),
                    ]))));
  }
}
