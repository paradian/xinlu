import 'package:flutter/material.dart';
import 'package:app/components/bottom_navigator.dart';
import 'package:app/fetch/api.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';
 Dio dio = new Dio();
class ListRender extends StatefulWidget {
  @override
  State<StatefulWidget> createState (){
    return _ListRender();
  }
}

class SubwayItem {
 SubwayItem({
   this.name,
   this.url
});
  final String name;
 final String url;
}
 List<SubwayItem> arrays =[
  SubwayItem(name:'temp',url: 'www.baidu.com')
];
class _ListRender extends State<ListRender>{
  void getData() async {
//  await API().nodeList().then((res) {
//    print(res);
//  });
    var response = await dio.get('https://www.apidevelop.com/subway/city/data.json');
      print(response.toString());
      print('${response}');
//    await API().getList('GET').then((response){
//      print('${response.keys}---???');
//      print(response is Map);
//
//      setState(() {
////        response.forEach((cell)=>{
////          print('ddd${cell.toString()}'),
////          arrays.add(SubwayItem(
////            name: cell.name,
////            url:cell.url
////          ))
////        });
//      });
//    });
  }

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    getData();
    return Scaffold(
      appBar: AppBar(title: Text('列表渲染'),backgroundColor: Colors.lightGreenAccent,),
      body: ListView.builder(
        itemBuilder: array,
        itemCount: arrays.length,
      ),
        bottomNavigationBar: BottomNavigation(),
      );
  }

  Widget array (BuildContext context ,int index){

    return Container(
      child: Column(
        children: <Widget>[
          Text(arrays[index].name)
        ],
      ),
    );
  }
}
