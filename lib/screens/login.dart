// import 'dart:js';

import 'package:todolist/model/list_user_model.dart';
import 'package:todolist/screens/register.dart';
import 'package:path/path.dart' as Path;
import 'package:todolist/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:todolist/services/list_user_service.dart';

final myUsernameController = TextEditingController();
final myPasswordController = TextEditingController();

final _services = UsersServices();

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final myUsernameController = TextEditingController();
  @override
  // _LoginScreen createState() => _LoginScreen();
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    //Mencari tahu orientasi potret atau landcape
    final bool isLansCape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              //Jika Landscape
              child: (isLansCape)
                  ? Column(
                      children: [
                        // SizedBox(
                        //   width: 30,
                        // ),
                        Container(
                          // padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                          width: mediaQueryWidth * 0.3,
                          height: mediaQueryHeight * 0.3,
                          child: Image.asset("assets/images/logo.png"),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(30.0),
                          // width: mediaQueryWidth * 0.8,
                          // height: mediaQueryHeight * 0.6,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromARGB(255, 247, 247, 247),
                            border: Border.all(color: Colors.black, width: 2.0),
                          ),
                          child: Column(
                            children: [
                              _TextField(),
                              MaterialButton(
                                minWidth: 85.0,
                                height: 50.0,
                                color: Color.fromARGB(255, 10, 1, 134),
                                textColor: Colors.white,
                                onPressed: () async {
                                  Future<UsersServices?> result =
                                      await _services.loginUser(
                                    username: myUsernameController.text,
                                    password: myPasswordController.text,
                                  ) as Future<UsersServices?>;

                                  result.then((value) {
                                    if (value != null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    } else {
                                      print("Username atau Password Salah");
                                    }
                                  });
                                },
                                child: SizedBox(
                                  width: 50,
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              // _LoginButton(context),
                              Padding(padding: EdgeInsets.only(top: 20)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    register()));
                                      },
                                      child: Text(
                                        "Daftar",
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('Comingsoon'),
                                          ),
                                        );
                                      },
                                      child: Text("Lupa Pasword"))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  // ----------------------------------------------------------Jika Potrait
                  : Column(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          // padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                          width: mediaQueryWidth * 0.4,
                          height: mediaQueryHeight * 0.4,
                          child: Image.asset("assets/images/logo.png"),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        Container(
                          // margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(20.0),
                          width: mediaQueryWidth * 0.8,
                          height: 350.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Color.fromARGB(255, 247, 247, 247),
                            border: Border.all(color: Colors.black, width: 2.0),
                          ),
                          child: Column(
                            children: [
                              _TextField(),
                              MaterialButton(
                                minWidth: 85.0,
                                height: 50.0,
                                color: Color.fromARGB(255, 10, 1, 134),
                                textColor: Colors.white,
                                onPressed: () async {
                                  await _services
                                      .loginUser(
                                    username: myUsernameController.text,
                                    password: myPasswordController.text,
                                  )
                                      .then((value) {
                                    print(value);
                                    if (value != null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    } else {
                                      print("Username atau Password Salah");
                                    }
                                  });
                                },
                                child: SizedBox(
                                  width: 50,
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              // _LoginButton(context),
                              Padding(padding: EdgeInsets.only(top: 20)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    register()));
                                      },
                                      child: Text(
                                        "Daftar",
                                      )),
                                  TextButton(
                                      onPressed: (null),
                                      child: Text("Lupa Pasword"))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                color: Color.fromARGB(255, 92, 92, 92),
                height: 20.0,
                child: Column(
                  children: [
                    Center(
                      child: Text("Copyright @2022 by Google"),
                    )
                  ],
                ))),
      ),
    );
  }
}

Widget _TextField() {
  // final myUsernameController = TextEditingController();
  // final myPasswordController = TextEditingController();
  // String nUsername, nPassword;
  // final _formKey = GlobalKey<FormState>();

  return Form(
    key: _formKey,
    child: Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 5)),
        // Container(child: Text("Username")),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'please Input Username';
            }
            return null;
          },
          controller: myUsernameController,
          decoration: InputDecoration(
              label: Text("Username"),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              hintStyle: TextStyle(color: Colors.black)),
          style: TextStyle(color: Colors.black),
          autofocus: false,
        ),
        Padding(padding: EdgeInsets.only(top: 12.0)),

        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'please Input Password';
            }
            return null;
          },
          maxLength: 16,
          // maxLengthEnforced: true,
          controller: myPasswordController,
          obscureText: true,
          decoration: InputDecoration(
              label: Text("Password"),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              hintStyle: TextStyle(color: Colors.black)),
          style: TextStyle(color: Colors.black),
          autofocus: false,
        ),

        SizedBox(
          height: 25,
        )
      ],
    ),
  );
}
