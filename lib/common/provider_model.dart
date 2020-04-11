import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
//注册一个状态管理的model
class CountModel with ChangeNotifier {
  int _counter = 8;
  int get value => _counter;
  void increment (){
    _counter ++;
    notifyListeners();
  }
}
//全局共享tabBar的索引
class BottomModel with ChangeNotifier {
  int _currentIndex = 0;
  int get value => _currentIndex;
  //接收参数，对索引进行赋值
  setIndex(index){
    print('$index---$_currentIndex');
    _currentIndex = index;
    notifyListeners();
  }
}
class userToken with ChangeNotifier {
  var _token = '';
  get value => _token;
  setToken(token) {
    _token = token;
    notifyListeners();
  }
}
final counter = CountModel();
final active = BottomModel();
final token = userToken();
final textSize = 48;
var providerList = [
  ChangeNotifierProvider.value(value: counter),
  ChangeNotifierProvider.value(value: active),
  ChangeNotifierProvider.value(value: token),
  Provider.value(value: textSize),

];