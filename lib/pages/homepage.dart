import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  static final String id = "homepage";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}
