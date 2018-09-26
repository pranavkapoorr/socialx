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
class CommonScaffold extends StatelessWidget {
  final appTitle;
  final Widget bodyData;
  final showFAB;
  final showDrawer;
  final backGroundColor;
  final actionFirstIcon;
  final scaffoldKey;
  final showBottomNav;
  final floatingIcon;
  final floatingOnTap;
  final centerDocked;
  final elevation;
  final leftBottomBarWidget;
  final rightBottomBarWidget;

  CommonScaffold({
        this.appTitle,
        this.bodyData,
        this.showFAB = false,
        this.showDrawer = false,
        this.backGroundColor,
        this.actionFirstIcon = Icons.search,
        this.scaffoldKey,
        this.showBottomNav = false,
        this.centerDocked = false,
        this.floatingIcon,
        this.floatingOnTap,
        this.elevation = 4.0,
        this.leftBottomBarWidget,
        this.rightBottomBarWidget
      });

  Widget myBottomBar() => new BottomAppBar(
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
            child: leftBottomBarWidget
          ),
          new SizedBox(
            width: 20.0,
          ),
          SizedBox(
            height: double.infinity,
            child: rightBottomBarWidget,
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey != null ? scaffoldKey : null,
      backgroundColor: backGroundColor != null ? backGroundColor : null,
      appBar: AppBar(
        elevation: elevation,
        backgroundColor: Colors.black,
        title: Text(appTitle),
        actions: <Widget>[
          SizedBox(
            width: 5.0,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(actionFirstIcon),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      drawer: showDrawer ? CommonDrawer() : null,
      body: bodyData,
      floatingActionButton: showFAB
          ? CustomFloat(
        //builder: centerDocked
            //? Text(
          //"5",
          //style: TextStyle(color: Colors.white, fontSize: 10.0),
        //)
            //: null,
        icon: floatingIcon,
        qrCallback: floatingOnTap,
      )
          : null,
      floatingActionButtonLocation: centerDocked
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: showBottomNav ? myBottomBar() : null,
    );
  }
}
class CustomFloat extends StatelessWidget {
  final Icon icon;
  final Widget builder;
  final VoidCallback qrCallback;
  final isMini;

  CustomFloat({this.icon, this.builder, this.qrCallback, this.isMini = false});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: isMini,
      onPressed: qrCallback,
      child: Ink(
        decoration: new BoxDecoration(
          //gradient: new LinearGradient(colors: UIData.kitGradients)
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            icon,
            builder != null
                ? Positioned(
              right: 7.0,
              top: 7.0,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: builder,
                radius: 10.0,
              ),
            )
                : Container(),
            // builder
          ],
        ),
      ),
    );
  }
}
class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Pranav Kapoor",
            ),
            accountEmail: Text(
              "pranavkapoorr@gmail.com",
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  "https://scontent.fyyz1-1.fna.fbcdn.net/v/t1.0-1/p320x320/11230099_10206835592669367_2911893136176495642_n.jpg?_nc_cat=111&oh=005e87a02bccaf399b5152534993298c&oe=5C2A1D27"),
            ),
          ),
          new ListTile(
            title: Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          new ListTile(
            title: Text(
              "Shopping",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
          ),
          new ListTile(
            title: Text(
              "Dashboard",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
          ),
          new ListTile(
            title: Text(
              "Timeline",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.timeline,
              color: Colors.cyan,
            ),
          ),
          Divider(),
          new ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
          ),
          Divider(),
          new AboutListTile()
        ],
      ),
    );
  }
}