import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page of Panav's App"),
      ),
      body: Center(
        child: Text(
          'Login Page',
          style: TextStyle(
            fontSize: 40,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 0.75,
        ),
      ),
    );
  }
}
