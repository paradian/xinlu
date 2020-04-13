import 'dart:io';
import 'dart:async';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:app/common/provider_model.dart';

class FlutterDemo extends StatefulWidget {
  FlutterDemo({Key key}) : super(key: key);

  @override
  _FlutterDemoState createState() => new _FlutterDemoState();
}
class CartItem {
 CartItem({
   this.name,
   this.count,
   this.price
});
   String name;
  int count;
  double price;
}
class _FlutterDemoState extends State<FlutterDemo> {

  int _counter;
  @override
  void initState() {

    super.initState();
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
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

  Future<Null> _incrementCounter() async {
    print('enter');
    setState(() {
      _counter++;
    });
    // write the variable as a string to the file
    await (await _getLocalFile()).writeAsString('$_counter');
  }
Future<Null> _clearCounter() async{
    print('enter clear');
  await (await _getLocalFile()).writeAsString('0');
  setState(() {
    _counter = 0;
  });
}

  @override
  Widget build(BuildContext context) {
   final counter = Provider.of<CountModel>(context);
   final textSize = Provider.of<int>(context).toDouble();
   final cartList = Provider.of<cartListModel>(context);
    return new Scaffold(
      appBar: new AppBar(title: new Text('Flutter Demo')),
      body: new Container(
        child:Column(
          children: <Widget>[
            cartList.value.length !=0 ? ListView.builder(itemBuilder: cart_list,itemCount: cartList.value.length,shrinkWrap: true,scrollDirection: Axis.vertical,):Text('null'),
            new Text('Button tapped $_counter time${
                _counter == 1 ? '' : 's'
            }.'),
             FlatButton(onPressed:()=>cartList.addItem(new CartItem(name:'烤面筋',count:2,price:3.5)), child: Text('加入烤面筋')),
              FlatButton(onPressed:()=>cartList.addItem(new CartItem(name:'羊腰子',count:2,price:3.5)), child: Text('加入羊腰子')),
               FlatButton(onPressed:()=>cartList.addItem(new CartItem(name:'虎鞭',count:2,price:3.5)), child: Text('加入虎鞭')),
            new FlatButton(onPressed:()=> _clearCounter, child: Text('clear')),
           FlatButton(onPressed: ()=>counter.increment(),child:  Text('value id ${counter.value}',style: TextStyle(fontSize: textSize,color: Colors.deepPurple)),),
            Text(cartList.value.toString()),
//
          ],
        ),
        height: 400.0,
        width: 400.0,

      ),
      floatingActionButton: new FloatingActionButton(
        onPressed:() => _incrementCounter(),
        tooltip: 'Increment',
        child:

            new Icon(Icons.add),
//

      ),

    );
  }
  Widget cart_list (BuildContext context,int index){
//    final cartList = Provider.of<cartListModel>(context);
print("cartList.value[0]");
  print(cartList.value[0]);
   print(cartList.value[0].name);
  return  Container(
  child: Column(
  children: <Widget>[
  Text('名称：${cartList.value[index].name}'),
    Text('数量：${cartList.value[index].count}'),
    Text('价格：${cartList.value[index].price}')
    ],
    
    ),
      width: 80.0,
      height: 80.0,
      
  );

  }
}
