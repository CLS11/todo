import 'package:flutter/material.dart';
// Re-comment out the following in order to access the UserInput page
//import 'pages/user_input.dart';
//importing hive library
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/home_page.dart';

void main() async {
  //hive init
  await Hive.initFlutter();
  //opening a box
  var box = await Hive.openbox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // For user Input
      //home: UserInput(),
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
