import 'package:flutter/material.dart';
import 'package:socialx/views/albumuploader.dart';
import 'package:socialx/views/utils/utils.dart';

class EditProfile extends StatefulWidget {

  @override
  _EditProfileState createState() => new _EditProfileState();
}
class _EditProfileState extends State<EditProfile>{
  TextEditingController name,username,about,location;
  String _gender,_radioValue;

  @override
  void initState() {
    name = new TextEditingController();
    username = new TextEditingController();
    about = new TextEditingController();
    location = new TextEditingController();

    super.initState();
  }

  void _handleGenderChange(String value){
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case "Male":
          _gender = "Male";
          break;
        case "Female":
          _gender = "Female";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient:myGradient,),
      child: new Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed:(){
            //_updateMyDetails();
            Navigator.pop(context);
          }),
            elevation: 0.0,
            title: new Text("Edit Profile",style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.all(Radius.circular(5.0))
            ),
            child:SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey.shade100,),
                child:
                new Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 5.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: NetworkImage("https://scontent.fyyz1-1.fna.fbcdn.net/v/t1.0-1/p320x320/11230099_10206835592669367_2911893136176495642_n.jpg?_nc_cat=111&oh=005e87a02bccaf399b5152534993298c&oe=5C2A1D27"),
                                radius: 45.0,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 2.0),
                            child: OutlineButton(onPressed: (){},child: Text("Change Picture"),color: Colors.redAccent,splashColor: Colors.redAccent,),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white70,
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsetsDirectional.only(top: 8.0,bottom: 5.0),
                      child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[Text("General",style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),)],),

                            new ListTile(leading:Icon(Icons.contact_mail,color: Colors.redAccent,),title: TextField(decoration: InputDecoration.collapsed(hintText: "username"),controller: username,)),
                            new Divider(height: 0.1,color: Colors.grey.shade400,),
                            new ListTile(leading: new Icon(Icons.person,color:Colors.green),title:TextField(decoration: InputDecoration.collapsed(hintText: "Full name"),controller: name,)),
                            new ListTile(leading: new Icon(Icons.location_on,color:Colors.red),title:TextField(decoration: InputDecoration.collapsed(hintText: "Location"),controller: location,)),
                            new Divider(height: 0.1,color: Colors.grey.shade400,),
                            new ListTile(leading: new Icon(Icons.wc,color:Colors.amberAccent),title:Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(value: "Male",groupValue: _radioValue,onChanged: _handleGenderChange,),Text("Male"),
                                Radio(value: "Female",groupValue: _radioValue,onChanged: _handleGenderChange,),Text("Female")
                              ],
                            )),
                          ]),
                    ),
                    GestureDetector(
                      onTap: _goToAlbumUploader,
                      child: Container(
                        color: Colors.white70,
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsetsDirectional.only(top: 8.0,bottom: 5.0),
                        child: Column(
                            children: <Widget>[
                              Row(children: <Widget>[Text("Album",style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),)],),
                              Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(Icons.image,size: 35.0,color: Colors.redAccent,),
                                      Container(
                                        height: 50.0,
                                        constraints: BoxConstraints(maxWidth: 260.0,maxHeight: 50.0),
                                        child: _album(),
                                      ),
                                      Icon(Icons.navigate_next)
                                    ],
                                  ),
                                ],
                              )
                            ]
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white70,
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsetsDirectional.only(top: 8.0,bottom: 15.0),
                      child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[Text("About Me",style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),)],),
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.description,color: Colors.green,size: 35.0,),
                                    Container(
                                        constraints: BoxConstraints(maxWidth: 200.0,maxHeight: 90.0),
                                        child:TextField(
                                          controller: about,
                                          decoration: InputDecoration(
                                              hintText: "short bio",
                                              border: InputBorder.none
                                          ),
                                          maxLines: 5,
                                          maxLength: 150,
                                          maxLengthEnforced: true,
                                          enabled: true,
                                          keyboardType: TextInputType.multiline,
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ]
                      ),
                    )

                  ],
                )
                  ),
            ),

          )
      ),
    );
  }
  Widget _albumImage(Image image){
    return  GestureDetector(onTap:(){},child: Container(margin: EdgeInsets.all(1.0),child:image));
  }
  Widget _album() {
    List<Widget> images = [
      _albumImage(new Image(image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg"),width: 50.0,height: 50.0,)),
      _albumImage(new Image(image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg"),width: 50.0,height: 50.0,)),
      _albumImage(new Image(image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg"),width: 50.0,height: 50.0,)),
      _albumImage(new Image(image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg"),width: 50.0,height: 50.0,)),
      _albumImage(new Image(image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg"),width: 50.0,height: 50.0,)),

    ];
    return Container(
      child: new ListView(
          scrollDirection: Axis.horizontal,
          children: images
      ),
    );
  }
  void _goToAlbumUploader(){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new AlbumUploader()));
  }


  @override
  void dispose() {
    name.dispose();
    username.dispose();
    about.dispose();
    super.dispose();
  }
}