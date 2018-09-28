import 'package:flutter/material.dart';
import 'package:socialx/models/post.dart';
import 'package:socialx/views/utils/utils.dart';

class TimeLine extends StatefulWidget{
  final bool _showSearch;
  TimeLine(this._showSearch);

  @override
  _TimeLineState createState()=> new _TimeLineState();
}

class _TimeLineState extends State<TimeLine>{


  @override
  initState(){
    super.initState();

  }

  Widget profileColumn(BuildContext context, Post post) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(post.personImage),
      ),
      Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  post.personName,
                  style: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .apply(fontWeightDelta: 700),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  post.address,
                  style: Theme.of(context).textTheme.caption.apply(
                      //fontFamily: UIData.ralewayFont,
                      color: Colors.pink),
                )
              ],
            ),
          )),
      IconButton(icon: Icon(Icons.more_vert),iconSize: 16.0,onPressed: (){},)
    ],
  );

  //column last
  Widget actionColumn(Post post) => ButtonBar(
    alignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      IconButton(
        icon: Icon(
           Icons.thumb_up,
          color: Colors.green,
        ),
        onPressed: (){},
      ),
      IconButton(
        icon: Icon(
           Icons.comment,
          color: Colors.blue,
        ),
        onPressed: (){},
      ),
      Text(
        post.postTime,
      )
    ],
  );

  //post cards
  Widget postCard(BuildContext context, Post post) {
    return Card(
      elevation: 2.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: profileColumn(context, post),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.message,
              style: TextStyle(
                  fontWeight: FontWeight.normal,)
                  //fontFamily: UIData.ralewayFont),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          post.messageImage != null
              ? Image.network(
            post.messageImage,
            fit: BoxFit.cover,
          )
              : Container(),
          post.messageImage != null ? Container() : CommonDivider(),
          actionColumn(post),
        ],
      ),
    );
  }
  Widget statusBox() => new Card(
      elevation: 2.0,
      child: Column(
          children: <Widget>[
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage("https://scontent-lht6-1.xx.fbcdn.net/v/t1.0-9/11230099_10206835592669367_2911893136176495642_n.jpg?_nc_cat=0&oh=eb80db39d72968cc4a130d4d075ea24a&oe=5BE80A4C",),
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Pranav Kapoor",
                            style: Theme
                                .of(context)
                                .textTheme
                                .body1
                                .apply(fontWeightDelta: 700),
                          ),
                        TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              hintText: "What's on your mind?",
                              hintStyle: TextStyle(fontSize: 13.0,color: Colors.grey)
                          ),
                        )

                        ]
                    )
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(icon: Icon(Icons.send), onPressed: (){})
            )
          ]
      )
  )
          ]
      )
  );

  Widget bodyList(List<Post> posts) => SliverList(
    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: postCard(context, posts[index]),
      );
    },childCount: posts.length),
  );

  Widget bodySliverList() {
    return
        CustomScrollView(
                slivers: <Widget>[
                  //statusBox(),
                  bodyList(posts),
                ],
              );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            statusBox(),
            Expanded(child: bodySliverList()),
          ],
        ),
        widget._showSearch?searchArea():Text('')
      ],
    );
  }
  Widget searchArea()=>new Container(
    color: Colors.white.withOpacity(0.9),
    child: Center(child: Text("Search here"),),
  );


}
