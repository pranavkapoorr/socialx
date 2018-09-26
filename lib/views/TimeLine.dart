import 'package:flutter/material.dart';
import 'package:socialx/models/post.dart';
import 'package:socialx/views/utils/utils.dart';

class TimeLine extends StatefulWidget{
  @override
  _TimeLineState createState()=> new _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {

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
      Icon(
         Icons.thumb_up,
        color: Colors.green,
      ),
      Icon(
         Icons.comment,
        color: Colors.blue,
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
                  bodyList(posts),
                ],
              );
  }

  @override
  Widget build(BuildContext context) {
    return bodySliverList();
  }
}
