import 'package:flutter/material.dart';
class CommonDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.shade300,
      height: 8.0,
    );
  }
}
class ProfileTile extends StatelessWidget {
  final title;
  final subtitle;
  ProfileTile({this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
var settingsGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Colors.blue,Colors.blue.shade700,Colors.blue.shade500,Colors.blue.shade200,Colors.blue.shade50]
);
var myGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.blue,Colors.blue.shade700,Colors.blue.shade500,Colors.blue.shade200,Colors.blue.shade50]
);
List<BoxShadow> myShadow = [
  new BoxShadow(
    color: Colors.black12,
    offset: new Offset(2.0, 5.0),
    blurRadius: 1.0,
    spreadRadius: 1.0
  )
];