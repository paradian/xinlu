import 'package:flutter/material.dart';
import 'model/post.dart';
import 'model/list.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app/model/home.dart';
import 'package:app/routes/routes.dart';
void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'mephisto',
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

//class NewRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('new route'),
//      ),
//      body: Center(
//        child: Text('this is a new route'),
//      ),
//    );
//  }
//}

//class Home extends StatelessWidget {
//  @override
//  Widget list(BuildContext context, int index) {
//    return Container(
//      color: Colors.white,
//      margin: EdgeInsets.all(8.0),
//      child: Column(
//        children: <Widget>[
//          SizedBox(
//            height: 16.0,
//          ),
//          Text(posts[index].title),
//          FlatButton(
//            child: Text('changeRoute'),
//            textColor: Colors.yellow,
//            onPressed: () => {
//              Fluttertoast.showToast(msg: 'click to login',fontSize: 14.0),
//              Navigator.push(context, MaterialPageRoute(builder: (context) {
//                return NewRoute();
//              }))
//            },
//          )
//        ],
//      ),
//    );
//  }

//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.grey[100],
//      appBar: AppBar(
//        title: Text('app'),
//        elevation: 0.0,
//      ),
//      body: ListView.builder(
//        itemBuilder: list,
//        itemCount: posts.length,
//      ),
//    );
//  }
//}
