import 'dart:io';

import 'package:app/model/list.dart';
import 'package:app/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/components/drawer_demo.dart';
import 'package:app/components/bottom_navigator.dart';
import 'package:path_provider/path_provider.dart';
class Home extends StatelessWidget{

  //list 构建列表渲染
  Widget list(BuildContext context,int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 16.0),
          Text(posts[index].title),
//          NetworkAssetBundle(),
          FlatButton(
            child: Text(posts[index].descript),
            textColor: Colors.teal,
            onPressed: () =>{
              Navigator.pushNamed(context, '/list',arguments: {'title':'list-page'})
            },
          )
        ],
      ),
    );
  }
  //将list放进碎片中
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text('首页'),
        elevation: 0,

      ),
      body: ListView.builder(itemBuilder: list,
      itemCount: posts.length,),
      drawer: DrawerDemo(),
      bottomNavigationBar: BottomNavigation()

    );
  }
}