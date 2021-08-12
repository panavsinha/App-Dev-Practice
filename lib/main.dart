import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_practice/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*double pi = 3.14;
    bool ismale = true;
    var isname = "Panav";
    const pi = 3.14;
    */
    return MaterialApp(home: homepage());
  }
}
