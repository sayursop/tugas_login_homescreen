import 'package:flutter/material.dart';

class ShowPassword extends StatefulWidget {
  @override
  _ShowPasswordState createState() => _ShowPasswordState();
}

class _ShowPasswordState extends State<ShowPassword> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key_off),
        labelText: "Password",
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
    );
  }
}