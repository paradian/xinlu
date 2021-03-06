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
// class CartItem {
//  CartItem({
//    this.name,
//    this.count,
//    this.price
// });
//    String name;
//   int count;
//   double price;
// }
class cartListModel with ChangeNotifier {
  
  var _list = [];
  int _total = 0;
  // get total => total;
  get value => _list;
  addItem(item){
    print('enter${_list.length}--$item');
    _list.add(item);
    notifyListeners();
  }
  removeItem(index){
    _list.removeAt(index);

    notifyListeners();
  }
  changeItem(index,count){
    if(count == 0){
      _list.removeAt(index);
    } else {
_list[index].count = count;
    }
    notifyListeners();
  }
  getTotal(){
    _list.length !=0 ?_list.forEach((item) =>{
      _total += item.price*item.count
    }):(_total = 0);
    int total = _total;
    notifyListeners();
  }
}
final counter = CountModel();
final active = BottomModel();
final token = userToken();
final cartList = cartListModel();
final textSize = 48;
var providerList = [
  ChangeNotifierProvider.value(value: counter),
  ChangeNotifierProvider.value(value: active),
  ChangeNotifierProvider.value(value: token),
  ChangeNotifierProvider.value(value: cartList),
  Provider.value(value: textSize),
];