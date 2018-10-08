import 'package:flutter/material.dart';
import 'package:socialx/views/editprofile.dart';
import 'package:socialx/views/settings.dart';
import 'package:socialx/views/utils/utils.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState()=> new _ProfileState();
}

class _ProfileState extends State<Profile>{
  var deviceSize;

  //Column1
  Widget profileColumn() => Padding(
    padding: const EdgeInsets.fromLTRB(8.0,2.0,8.0,0.0),
    child: new ClipPath(
      clipper: MyClipper(),
      child: Container(
        decoration: BoxDecoration(gradient: myGradient,border: Border.all(color: Colors.grey.shade300)),
        height: deviceSize.height * 0.24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProfileTile(
              title: "Pranav Kapoor",
              subtitle: "London",
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  //color: Colors.black,
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new Settings()));
                  },
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
                  icon: Icon(Icons.edit),
                  //color: Colors.black,
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new EditProfile()));
                  },
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
          "Hi I'm Pranav. I'm Nothing..doing Everything..to be Something..!",
          style: TextStyle(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
          maxLines: 3,
          softWrap: true,
        ),
      ),
    ),
  );

  Widget photosColumn() => Container(
    color: Colors.white,
    height: deviceSize.height * 0.13,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
            height: deviceSize.height/10,
            child: _album()
        )
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
                  subtitle: "pranavkapoorr.github.io",
                ),
                ProfileTile(
                  title: "Phone",
                  subtitle: "+44 74887 06094",
                ),
                ProfileTile(
                  title: "YouTube",
                  subtitle: "@pranavkapoorr",
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTile(
                  title: "Location",
                  subtitle: "London",
                ),
                ProfileTile(
                  title: "Email",
                  subtitle: "pk@gmail.com",
                ),
                ProfileTile(
                  title: "Facebook",
                  subtitle: "fb.com/pranavkapoorr",
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
          Card(
            elevation: 2.0,
            child: Column(
              children: <Widget>[
                profileColumn(),
                CommonDivider(4.0),
                followColumn(deviceSize),
              ],
            ),
          ),

          CommonDivider(8.0),
          descColumn(),
          CommonDivider(8.0),
          photosColumn(),
          CommonDivider(8.0),
          accountColumn()
        ],
      ),
    );
  }

  Widget followColumn(Size deviceSize) => Padding(
    padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,1.0),
    child:   Container(
      height: deviceSize.height * 0.07,
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
  );

  Widget _albumImage(Image image){
    return  GestureDetector(onTap:(){onImageTap(image);},child: Container(margin: EdgeInsets.all(1.5),child:image));
  }
  Widget _album() {
    List<Widget> images = [
      _albumImage(new Image(image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg"))),
      _albumImage(new Image(image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg"))),
      _albumImage(new Image(image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg"))),
      _albumImage(new Image(image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg"))),
      _albumImage(new Image(image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg"))),
      _albumImage(new Image(image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg"))),
    ];
    return Container(
      color: Colors.black.withOpacity(0.1),
      child: new ListView(
          scrollDirection: Axis.horizontal,
          children: images
      ),
    );
  }

  void onImageTap(Image img){
    showDialog(context: this.context,builder:(BuildContext context)=>AlertDialog(content: Container(
      child: img,
    ),contentPadding: EdgeInsets.all(0.5),)
    );
  }



  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return bodyData();
  }
}




