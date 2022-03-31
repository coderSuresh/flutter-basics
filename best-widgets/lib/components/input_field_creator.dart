import 'package:flutter/material.dart';

class InputFieldCreator extends StatelessWidget {
  final String hint;
  final String label;
  final bool obscure;

  InputFieldCreator(
      {Key? key,
      required this.hint,
      required this.label,
      required this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
      child: TextFormField(
        obscureText: obscure,
        cursorColor: Colors.deepPurple.shade900,
        decoration: InputDecoration(
          hintText: hint,
          label: Text(
            label,
            style: TextStyle(color: Colors.deepPurple.shade900),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade900),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade900),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "$label can not be empty";
          }
          return null;
        },
      ),
    );
  }
}
