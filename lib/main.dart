import 'package:flutter/material.dart';
import 'package:todolist/widgets/launcher.dart';
import 'package:todolist/screens/login.dart';
import 'package:todolist/screens/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LauncherPage(),
      // routes: <String, WidgetBuilder>{
      //   '/login': (BuildContext context) => new LoginPage(),
      //   '/landing': (BuildContext context) => new LandingPage(),
      // },
    );
  }
}
