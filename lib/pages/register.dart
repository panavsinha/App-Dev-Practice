import 'package:flutter/material.dart';
import 'package:flutter_practice/utils/routes.dart';

class RegPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15.0),
            Image.asset(
              "assets/images/register.png",
              fit: BoxFit.cover,
              //height: 1000,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Please enter your registration details",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter your Full Name",
                          labelText: "Full Name"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter your email ID", labelText: "E-Mail"),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter password", labelText: "Password"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Re-enter your password",
                          labelText: "Confirm Password"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.loginRoute);
                      },
                      child: Text("Submit", style: TextStyle(fontSize: 16)),
                      style: TextButton.styleFrom(minimumSize: Size(120, 50)),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
