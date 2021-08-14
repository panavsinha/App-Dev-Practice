import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/homepage.dart';
import 'package:flutter_practice/pages/loginpage.dart';
import 'package:flutter_practice/pages/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => homepage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
