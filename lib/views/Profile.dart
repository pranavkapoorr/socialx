import 'package:flutter/material.dart';
import 'package:socialx/views/utils/utils.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState()=> new _ProfileState();
}

class _ProfileState extends State<Profile>{
  var deviceSize;

  //Column1
  Widget profileColumn() => Padding(
    padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
    child: Card(
      elevation: 2.0,
      child: Container(
        height: deviceSize.height * 0.24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProfileTile(
              title: "Pranav Kapoor",
              subtitle: "Developer",
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.chat),
                  //color: Colors.black,
                  onPressed: () {},
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(50.0)),
                    border: new Border.all(
                      color: Theme.of(context).secondaryHeaderColor,//Colors.black,
                      width: 4.0,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://scontent.fyyz1-1.fna.fbcdn.net/v/t1.0-1/p320x320/11230099_10206835592669367_2911893136176495642_n.jpg?_nc_cat=111&oh=005e87a02bccaf399b5152534993298c&oe=5C2A1D27"),
                    foregroundColor: Colors.black,
                    radius: 40.0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.call),
                  //color: Colors.black,
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );

  //column2

  //column3
  Widget descColumn() => Container(
    color: Colors.white,
    height: deviceSize.height * 0.13,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Text(
          "Google Developer Expert for Flutter. Passionate #Flutter, #Android Developer. #Entrepreneur #YouTuber",
          style: TextStyle(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
          maxLines: 3,
          softWrap: true,
        ),
      ),
    ),
  );
  //column4
  Widget accountColumn() => Container(
    color: Colors.white10,
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 2.0,
      child: Container(
        height: deviceSize.height * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTile(
                  title: "Website",
                  subtitle: "about.me/imthepk",
                ),
                ProfileTile(
                  title: "Phone",
                  subtitle: "+919876543210",
                ),
                ProfileTile(
                  title: "YouTube",
                  subtitle: "youtube.com/mtechviral",
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTile(
                  title: "Location",
                  subtitle: "New Delhi",
                ),
                ProfileTile(
                  title: "Email",
                  subtitle: "mtechviral@gmail.com",
                ),
                ProfileTile(
                  title: "Facebook",
                  subtitle: "fb.com/imthepk",
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Widget bodyData() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          profileColumn(),
          CommonDivider(),
          followColumn(deviceSize),
          CommonDivider(),
          descColumn(),
          CommonDivider(),
          accountColumn()
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return bodyData();
  }
}

Widget followColumn(Size deviceSize) => Padding(
  padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,1.0),
  child:   Card(
    elevation: 2.0,
    child:   Container(
      height: deviceSize.height * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ProfileTile(
            title: "1.5K",
            subtitle: "Posts",
          ),
          ProfileTile(
            title: "2.5K",
            subtitle: "Followers",
          ),
          ProfileTile(
            title: "1.2K",
            subtitle: "Following",
          )
        ],
      ),
    ),
  ),
);


