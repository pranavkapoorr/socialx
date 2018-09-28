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
  AnimationController _iconAnimationController;
  Animation _iconAnimation;
  PageController _pageController;
  bool _loaded = false;
  int _page = 1;
  bool _showSearch = false;

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
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeIn,
    );
    _iconAnimation.addListener(() => this.setState(() {}));

  }
  Widget searchAppBar(){
    _iconAnimationController.forward();
    var searchBar = new ListTile(title: new TextField(decoration: new InputDecoration(hintText: "         search here",suffixIcon: new Icon(Icons.search),border: InputBorder.none),));
  return new AppBar(
    leading: new IconButton(icon: new Icon(Icons.arrow_back), onPressed: (){setState(() {
      _showSearch = false;
      _iconAnimationController.reset();
    });}),
    title: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5.0)),
      child: searchBar,
      width: _iconAnimation.value * 1400.0,height: 40.0,
    ),
  );
  }

  Widget _scaffold() => Scaffold(
    appBar: _showSearch?searchAppBar():new AppBar(
      title: Text(_page==0?"Profile":_page==1?"Feed":"Conversations"),
      actions: <Widget>[
        _page==0?new IconButton(icon: Icon(Icons.edit), onPressed: (){}):Text(''),
        _page==1?new IconButton(icon: Icon(Icons.search), onPressed: (){
          setState(() {
            _showSearch = true;
          });
        }):Text(''),
      ],
    ),
    body: _loaded?new PageView(
      children: <Widget>[
        new Profile(),
        new TimeLine(_showSearch),
        new ChatScreen()
      ],
      controller: _pageController,
      onPageChanged: onPageChanged,
    ):Center(child: CircularProgressIndicator(),),
    backgroundColor: Colors.blue.shade50,//new Color(#FFE3F2FD),
    drawer: new CommonDrawer(),
    floatingActionButton:new FloatingActionButton(child: Icon(Icons.home,color: _page==1?Colors.white:Colors.black,size: _page==1?40.0:30.0,),onPressed: ()=>_navigationTapped(1)),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: new BottomAppBar(
      child: Ink(
        height: 50.0,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [
              new Color.fromRGBO(103, 218, 255, 1.0),
              new Color.fromRGBO(3, 169, 244, 1.0),
              new Color.fromRGBO(0, 122, 193, 1.0),
              Colors.blueGrey.shade800,
              Colors.black87,
            ])
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: double.infinity,
                child:  _bottomBarWidget("Profile",_page==0?20.0:12.0,_page==0?Colors.white:Colors.black,0),
            ),
            new SizedBox(
              width: 20.0,
            ),
            SizedBox(
              height: double.infinity,
              child: _bottomBarWidget("Messages",_page==2?20.0:12.0,_page==2?Colors.white:Colors.black,2),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _bottomBarWidget(String name, double size, Color color,int page){
    return new InkWell(
      radius: 15.0,
      splashColor: Colors.transparent,
      onTap: ()=>_navigationTapped(page),
      child: Center(
      child:new Text(
      name,
      style: new TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
      )
      )
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

  @override
  void dispose() {
    super.dispose();
    _loaded = false;
    _pageController.dispose();
    _iconAnimationController.dispose();
  }
}
