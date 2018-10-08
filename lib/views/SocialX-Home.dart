import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socialx/views/Conversations.dart';
import 'package:socialx/views/Profile.dart';
import 'package:socialx/views/TimeLine.dart';
import 'package:socialx/views/settings.dart';
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

class _SocialXHomeState extends State<SocialXHome> {
  FocusNode _focus = new FocusNode();
  PageController _pageController;
  TextEditingController _searchController;
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
    _searchController = new TextEditingController();
    _focus.addListener(_onFocusChange);

  }
  void _onFocusChange(){
    print("Focus: "+_focus.hasFocus.toString());
    if(_focus.hasFocus){
      setState(() {
        _showSearch = true;
      });
    }else{
      setState(() {
        _showSearch = false;
      });
    }
  }

  Widget searchAppBar(){
  return new AppBar(
    leading: IconButton(
      icon: Icon(Icons.settings),
      //color: Colors.black,
      onPressed: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new Settings()));
      },
    ),
    title: GestureDetector(
      onTap: (){
        setState(() {
          _showSearch = true;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical:15.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: TextFormField(
            controller: _searchController,
            decoration: InputDecoration.collapsed(hintText: "Search"),
            focusNode: _focus,
          ),
        ),
      ),
    ),
  );
  }

  Widget _scaffold() => Scaffold(
    appBar: searchAppBar(),
    body: Container(
      decoration: BoxDecoration(gradient: myGradient),
      child:_loaded?Stack(
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
        _showSearch?searchArea():Text('')
      ],
    ):Center(child: CircularProgressIndicator(),),
    ),
    backgroundColor: Colors.blue.shade50,//new Color(#FFE3F2FD),
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

  Widget searchArea()=>new Container(
    color: Colors.white.withOpacity(0.9),
    child: Center(child: Column(
      children: <Widget>[
        IconButton(icon:Icon(Icons.cancel),onPressed: (){
          setState(() {
            _focus.unfocus();
            _showSearch = false;
          });
        },),
        Text("Search here"),
      ],
    ),),
  );

  @override
  void dispose() {
    super.dispose();
    _showSearch = false;
    _loaded = false;
    _focus.removeListener(_onFocusChange);
    _pageController.dispose();
    _searchController.dispose();
  }
}
