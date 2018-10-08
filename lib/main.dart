import 'package:flutter/material.dart';
import 'package:socialx/views/logopage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SocialX',
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home: LogoPage(),
    );
  }
}