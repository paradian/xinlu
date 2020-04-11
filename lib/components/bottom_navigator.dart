import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:app/common/provider_model.dart';
class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigation();
  }
}

class _BottomNavigation extends State<BottomNavigation> {
  @override
  int _counter = 0;
  void getCounter() {
    _readFile().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _getFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  Future<int> _readFile() async {
    try {
      File file = await _getFile();
      String content = await file.readAsString();
      return int.parse(content);
    } on FileSystemException {
      return 0;
    }
  }




  Widget build(BuildContext context) {
    // TODO: implement build

    final active = Provider.of<BottomModel>(context);
    print(active.value);
    void _changeIndex(int index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/');
          break;
        case 1:
          Navigator.pushNamed(context, '/list-render');
          break;
        case 2:
          Navigator.pushNamed(context, '/list');
      }
      active.setIndex(index);
    }
    return BottomNavigationBar(
        currentIndex: active.value,
        onTap:_changeIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: Colors.deepPurple,
              ),
              title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.details,
                color: Colors.deepPurple,
              ),
              title: Text('详情')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              title: Text('我的$_counter'))
        ]);
  }
}
