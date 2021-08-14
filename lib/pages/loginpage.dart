import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/loginimage.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Welcome to the login page!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
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
                      print('Congratulations! You have successfully logged in');
                    },
                    child: Text("Submit"),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
