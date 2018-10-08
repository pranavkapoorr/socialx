import 'package:flutter/material.dart';

Widget CommonDivider(double height)=> Divider(
      color: Colors.grey.shade300,
      height: height,
    );
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
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.blue.shade700,Colors.blue.shade600,Colors.blue.shade400,Colors.blue.shade200,Colors.blue.shade50]
);
List<BoxShadow> myShadow = [
  new BoxShadow(
    color: Colors.black12,
    offset: new Offset(2.0, 5.0),
    blurRadius: 1.0,
    spreadRadius: 1.0
  )
];

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}