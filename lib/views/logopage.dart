import 'dart:async';
import 'package:flutter/material.dart';
import 'package:socialx/views/startuploader.dart';

class LogoPage extends StatefulWidget{
  @override
  _LogoPageState createState()=>new _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {

  @override
  void initState() {
    super.initState();
    new Timer(const Duration(seconds: 5), onClose);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    tileMode: TileMode.mirror,
                    colors: [Colors.blue.shade100,Colors.blue.shade50]
                )
            ),
            child: Padding(
              padding: new EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height/6),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: new Image(
                        //color: Colors.black87,
                        fit: BoxFit.scaleDown,
                        image: new AssetImage("images/logo.png"),
                      ),
                    ),
                    new Container(
                        padding: const EdgeInsets.all(20.0),
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment
                                .start,
                            children: <Widget>[
                              new Container(
                                  height: 50.0,
                                  width: 170.0,
                                  //color: Colors.grey.shade400,
                                  child: Image(image: new AssetImage("images/earth_loader.gif")),
                              ),
                            ])
                    )
                  ]),
            )
        )
    );
  }

  void onClose() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => new StartUpLoader(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}