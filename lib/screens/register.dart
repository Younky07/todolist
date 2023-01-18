import 'package:flutter/material.dart';
import 'package:todolist/screens/home.dart';
import 'package:todolist/screens/login.dart';
import 'package:todolist/services/list_user_service.dart';

class register extends StatefulWidget {
  const register();

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _usernameController = TextEditingController();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  final _services = UsersServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 10, 1, 134),
          title: const Text("Register"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _nimController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nim',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordConfirmController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Comfirm Password',
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 10, 1, 134),
                  onPrimary: Colors.white,
                ),
                onPressed: () async {
                  // register menggunakan service
                  if (_passwordController.text ==
                      _passwordConfirmController.text) {
                    await _services
                        .registerUser(
                            username: _usernameController.text,
                            nama: _namaController.text,
                            password: _passwordController.text,
                            nim: _nimController.text)
                        .then((value) {
                      if (value != null && value) {
                        print(value);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Berhasil Daftar'),
                          ),
                        );
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gagal Daftar'),
                          ),
                        );
                      }
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password Tidak Sama'),
                      ),
                    );
                  }
                },
                child: const SizedBox(
                  width: 100,
                  child: Text(
                    'Daftar',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text("Sudah mempunyai akun?"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Login",
                      )),
                  TextButton(onPressed: (null), child: Text("Lupa Pasword"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
