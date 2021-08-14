import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/utils/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15.0),
            Image.asset(
              "assets/images/loginimage.png",
              fit: BoxFit.cover,
              //height: 1000,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Welcome to the login page!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: Text("Submit", style: TextStyle(fontSize: 16)),
                      style: TextButton.styleFrom(minimumSize: Size(120, 50)),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
