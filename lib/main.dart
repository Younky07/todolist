import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todolist/todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text(snapshot.error.toString()),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState) {}
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Todo List',
            theme: ThemeData(
              scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
              primarySwatch: Colors.orange,
            ),
            home: TodoListPage(),
          );
        });
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Firebase.initializeApp(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Scaffold(
//             body: Center(child: Text(snapshot.error.toString())),
//           );
//         }
//         // if (snapshot.connectionState == ConnectionState.waiting) {
//         //   return Loading();
//         // }
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: TodoListPage(),
//           theme: ThemeData(
//             scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
//             primarySwatch: Colors.orange,
//           ),
//         );
//       },
//     );
//   }
// }
