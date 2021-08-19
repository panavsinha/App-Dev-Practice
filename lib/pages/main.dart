import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/homepage.dart';
import 'package:flutter_practice/pages/loginpage.dart';
import 'package:flutter_practice/pages/register.dart';
import 'package:flutter_practice/utils/routes.dart';
import 'package:flutter_practice/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      debugShowCheckedModeBanner: false,
      //initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.regRoute: (context) => RegPage()
      },
    );
  }
}
