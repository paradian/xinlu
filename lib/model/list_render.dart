import 'package:flutter/material.dart';
import 'package:app/components/bottom_navigator.dart';
import 'package:app/fetch/api.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
 Dio dio = new Dio();
class ListRender extends StatefulWidget {
  @override
  State<StatefulWidget> createState (){
    return _ListRender();
  }
}
Future<File> _getLocalFile() async {
  // get the path to the document directory.
  String dir = (await getApplicationDocumentsDirectory()).path;
  return new File('$dir/counter.txt');
}

Future<int> _readCounter() async {
  try {
    File file = await _getLocalFile();
    // read the variable as a string from the file.
    String contents = await file.readAsString();
    return int.parse(contents);
  } on FileSystemException {
    return 0;
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
  int _counter;
  void initState() {
    getData();
    super.initState();
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }
  void getData() async {
//  await API().nodeList().then((res) {
//    print(res);
//  });
    var response = await dio.get('https://www.apidevelop.com/subway/city/data.json');
    print(response.toString());
    print('${response.data}');
    print('${response.data is List}');
    setState(() {
      response.data.forEach((cell)=>{
        print(cell.toString()),
        arrays.add(SubwayItem(
            name: cell["name"],
            url:cell["url"]
        ))
      });
    });

//    await API().getList('GET').then((response){
//      print('${response.keys}---???');
//      print(response is Map);
//
//      setState(() {
////        response.forEach((cell)=>{
////          print('ddd${cell.toString()}'),
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

    return Scaffold(
      appBar: AppBar(title: Text('列表渲染$_counter'),backgroundColor: Colors.lightGreenAccent,),
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
          Text(arrays[index].name),
          FlatButton(child:Text('详情'),onPressed: (){ Navigator.pushNamed(context, '/subway-detail',arguments:{"url":arrays[index].url});})
        ],
      ),
    );
  }
}
