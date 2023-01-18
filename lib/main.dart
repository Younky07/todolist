import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todolist/todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        primarySwatch: Colors.orange,
      ),
      home: TodoListPage(),
    );
  }
}
