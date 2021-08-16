import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/main.dart';

void main() {
  runApp(MyApp());
}

class HomePage extends StatelessWidget {
  final int days = 30;
  final String isname = "Panav";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panav's First App"),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome to $days days of Flutter by $isname'),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
