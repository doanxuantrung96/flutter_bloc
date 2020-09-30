import 'package:flutter/material.dart';

class SecontActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecontActivityState();
  }
}

class SecontActivityState extends State<SecontActivity> {
  String title = "Hello!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
