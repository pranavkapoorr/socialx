import 'package:flutter/material.dart';
import 'package:socialx/views/SocialX-Home.dart';
class StartUpLoader extends StatefulWidget{

  _StartUpLoaderState createState() => new _StartUpLoaderState();

}

class _StartUpLoaderState extends State<StartUpLoader>{
  bool _loggedIn;
  StatefulWidget _startScreen;
  bool _loading;
  

  @override
  void initState() {
    super.initState();
    _loading = false;
    _startScreen = new SocialXHome();
    
  }


  @override
  Widget build(BuildContext context) {
    if(_loading == true){
      return new Scaffold(
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               new CircularProgressIndicator(strokeWidth: 5.0)
                ],
            ),
            new Padding(padding: new EdgeInsetsDirectional.only(top: 15.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              new Text("loading...",style: new TextStyle(fontSize: 25.0,color: Colors.grey),)
              ],
            ),
          ],)
      );
    }else{
      return _startScreen;
    }
  }

}