import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socialx/views/Conversations.dart';
import 'package:socialx/views/Profile.dart';
import 'package:socialx/views/TimeLine.dart';
import 'package:socialx/views/utils/utils.dart';
class SocialXHome extends StatefulWidget {
  @override
  _SocialXHomeState createState()=> new _SocialXHomeState();

  static Future<bool> exitApp(BuildContext context) {
    return showDialog(
      context: context,
      // ignore: deprecated_member_use
      child: new AlertDialog(
        title: new Text('Do you want to exit this application?'),
        content: new Text('We hate to see you leave...'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => (){return new Future<bool>.value(false);},
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () =>(){return new Future<bool>.value(true);},
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ;
  }
}

class _SocialXHomeState extends State<SocialXHome> with TickerProviderStateMixin{
  PageController _pageController;
  bool _loaded = false;
  int _page = 1;

  void onPageChanged(int page){
    setState((){
      this._page = page;
    });
  }


  @override
  void initState() {
    super.initState();
    _loaded = true;
    _pageController = new PageController(initialPage: 1);

  }


  Widget _scaffold() => CommonScaffold(
    appTitle: _page==0?"Profile":_page==1?"Feed":"Conversations",
    bodyData: _loaded?Stack(
      children: <Widget>[
        new PageView(
          children: <Widget>[
            new Profile(),
            new TimeLine(),
            new ChatScreen()
          ],
          controller: _pageController,
          onPageChanged: onPageChanged,
        ),
        //customNavigationBar()
      ],
    ):Center(child: CircularProgressIndicator(),),
    backGroundColor: Colors.blue.shade50,//new Color(#FFE3F2FD),
    showDrawer: true,
    showBottomNav: true,
    showFAB: true,
    floatingIcon: Icon(Icons.home,color: _page==1?Colors.white:Colors.black,size: _page==1?40.0:30.0,),
    centerDocked: true,
    leftBottomBarWidget: _bottomBarWidget("Profile",_page==0?20.0:12.0,_page==0?Colors.white:Colors.black),
    rightBottomBarWidget: _bottomBarWidget("Messages",_page==2?20.0:12.0,_page==2?Colors.white:Colors.black),
  );

  Widget _bottomBarWidget(String name, double size, Color color){
    return new Text(
      name,
      style: new TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
        //color: Colors.white
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: _scaffold(),
      onWillPop: (){return new Future<bool>.value(false);},
    );
  }

  void _navigationTapped(int page){
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }
  Widget customNavigationBar(){
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new Padding(
            padding: const EdgeInsets.all(2.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new IconButton(icon: new Icon(_page==0?Icons.person:Icons.person_outline,color: _page==1||_page==0?Colors.white:Colors.black26),iconSize: 30.0, onPressed: ()=>_navigationTapped(0)),
                new FloatingActionButton(onPressed: ()=>_navigationTapped(1),child: Image(image: AssetImage("images/logo.png"),color:_page==1?Colors.black:Colors.white,),backgroundColor: _page==1?Colors.white.withOpacity(0.7):Colors.transparent,shape: CircleBorder(side: BorderSide(color: _page==0?Colors.white:Colors.black26,width: 2.5,))),
                new IconButton(icon: new Icon(_page==2?Icons.chat:Icons.chat_bubble_outline,color: _page==1||_page==0?Colors.white:Colors.black45,),iconSize: 25.0,onPressed: ()=>_navigationTapped(2)),
              ],
            )
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _loaded = false;
    _pageController.dispose();
  }
}
