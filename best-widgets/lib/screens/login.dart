import 'package:flutter/material.dart';

import '../components/input_field_creator.dart';
import '../routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  void goHome() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputFieldCreator(
                hint: "john_doe", label: "Username", obscure: false),
            InputFieldCreator(
                hint: "xxxxxxxx", label: "Password", obscure: true),
            const SizedBox(height: 20),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.deepPurple.shade900),
              onPressed: () {
                goHome();
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
