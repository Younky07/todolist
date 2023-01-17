import 'dart:html';

import 'package:flutter/Material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.orange,
      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: deprecated_member_use, prefer_collection_literals
  List todos = [];

  late String input = "";

  @override
  void initState() {
    super.initState();
    todos.add("Item 1");
    todos.add("Item 2");
    todos.add("Item 3");
    todos.add("Item 4");
    todos.add("Item ");
  }

  void _tambahNama(String input) {
    setState(() {
      todos.add(input);
    });
  }

  @override
  Widget build(BuildContext context) {
    var icons;
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add Todolist"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            todos.add(input);
                          });
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Icon(
          icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todos[index]),
              child: Card(
                child: ListTile(
                  title: Text(todos[index]),
                ),
              ),
            );
          }),
    );
  }

  FlatButton({required Null Function() onPressed, required Text child}) {}
}
