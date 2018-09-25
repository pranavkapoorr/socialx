import 'package:flutter/material.dart';
import 'package:socialx/views/SocialX-Home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SocialX',
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home: SocialXHome(),
    );
  }
}