import 'package:todolist/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../model/modelUser.dart';
import '../services/service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // inisialisasi buat service dio
  final _service = ListUsersService();

  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void login(username, password) async {
    // cek ketika username dan password tidak kosong
    if (username != '' && password != '') {
      print('Successfull');

      loginData.setBool('login', false);

      // sekarang ini mengembalikan nilai boolean (true/false)
      await _service.postLogin(username, password).then((result) {
        // gunakan resultnya sebagai hasil boolean dari service login
        if (result != null && result == true) {
          print('berhasil login');

          // ketika berhasil set refrence dan bawa ke halaman utama
          loginData.setString('username', username);
          Navigator.pushNamed(context, '/utama');
        } else {
          print('tidak berhasil login');
        }
      }).onError((error, stackTrace) {
        // ketika error dio
        print('Terjadi kesalahan pada dio');
        print('error : $error');
        print('stackTree : $stackTrace');
      });
    }
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool('login') ?? true);
    print('newUser');

    // ini buat apa? kenapa ketika false dia di bawa ke utama?
    // apa karena kalau newUser nya false artinya user dah pernah login?
    if (newUser == false) {
      Navigator.pushNamed(context, '/utama');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 15.0),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Image.asset(
                    'Asset/img/animate.jpg',
                    width: ResponsiveValue(context,
                        defaultValue: 200.0,
                        valueWhen: const [
                          Condition.largerThan(name: TABLET, value: 350.0),
                          Condition.smallerThan(name: TABLET, value: 200.0)
                        ]).value,
                    height: ResponsiveValue(context,
                        defaultValue: 200.0,
                        valueWhen: const [
                          Condition.largerThan(name: TABLET, value: 350.0),
                          Condition.smallerThan(name: TABLET, value: 200.0)
                        ]).value,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 253, 253, 253),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: const Offset(
                            0.0,
                            0.0,
                          ),
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        )
                      ]),
                  child: Column(children: [
                    Field(
                        title: 'Username',
                        hint: 'masukan username anda',
                        controller: usernameController),
                    Field(
                        title: 'password',
                        hint: 'masukan password anda',
                        controller: passwordController),
                    SizedBox(
                      height: 25.0,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 224, 173, 5),
                          fixedSize: Size(200, 35),
                        ),
                        onPressed: () {
                          // Logic buat login
                          login(
                              usernameController.text, passwordController.text);
                        },
                        child: Text('Login'),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(onPressed: () {}, child: Text('Register')),
                        TextButton(
                            onPressed: () {}, child: Text('lupa password?')),
                      ],
                    )
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
