import 'package:flutter/material.dart';
import 'post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:app/fetch/api.dart';
import 'package:fluttertoast/fluttertoast.dart';

var dio = Dio();
var url = 'https://www.apidevelop.com/subway/city/data.json';

class List extends StatelessWidget {
  List({this.arguments});
  final Map arguments;
  _testDemo() async{
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body.toString());
    print('ddd');
    Response res = await dio.get(url);
    print(res);

  }
  void getData() async {
    print(arguments);
    print('argument');
await API().getList('GET').then((response) {
  print('enter');
  print(response);
});
  }
  void login() async {
    await API().login( '','POST',{'username':'admin','password':'admin'}).then((res){
      print('login');
      print(res);
    });
  }
  _loginDemo() async {
    var res = await http.post('http://47.92.213.232:9007/admin',headers:{'content-type':'application/json'},body:jsonEncode({'username':'admin','password':'admin'}));
    print(res.statusCode);
    print(jsonEncode({'username':'admin','password':'admin'}));
    print(jsonDecode(res.body)['data']);
    print('login demo');
    Response response = await dio.post('http://47.92.213.232:9007/admin',data:{'username':'admin','password':'admin'});
    print(response);
    response = await dio.get("https://img2018.cnblogs.com/blog/1041439/201905/1041439-20190517170325478-761458756.jpg");
    print(response.toString());
//  return res.body;
  }
  Widget list(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
          SizedBox(
            height: 16.0,
          ),
          Text(posts[index].title),
          FlatButton(
            child: Text('back'),
            onPressed: () =>{
              Fluttertoast.showToast(msg: 'click to login',fontSize: 14.0),
              getData(),
              login(),
              Navigator.pushNamed(context, '/')
            },
          )
        ]
      )
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('app'),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemBuilder: list,
        itemCount: posts.length,
      ),
    );
  }
}