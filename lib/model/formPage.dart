import 'package:app/fetch/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:app/fetch/api.dart';
import 'dart:async';

final _formKey = GlobalKey<FormState>();

class FormPage extends StatefulWidget {
  @override
//  _FormPage  createState() => _FormPage();
  _Form1 createState() => _Form1();
}

class _FormPage extends State<FormPage> {
  int count = 0;
  void login() async{
    var obj = {"name":'admin',"password":123456};
    await API().Login(obj).then((response){
      print(response);
    });
  }
  void AddCount() {
    print('enter,$count');
    setState(() {
      count = count + 1;
    });
  }

  void DecreaseCount() {
    print('enter,$count');
    setState(() {
      count = count - 1;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('coung:$count', textAlign: TextAlign.center),
      ),
      body: Container(
          padding: new EdgeInsets.all(1),
          child: new Row(
            children: <Widget>[
              new FlatButton(
                child: Text('Increase'),
                onPressed: AddCount,
              ),
              new FlatButton(
                child: Text('Decrease'),
                onPressed: DecreaseCount,
              ),
              new Container(),
            ],
          )),
    );
  }
}

class _Form1 extends State<FormPage> {
  int count = 0;
  bool _open = true;
  var _character = '';
  double percent = 71;
  bool checkValue = false;
  void login() async{
    var obj = {"username":'account',"password":'e10adc3949ba59abbe56e057f20f883e'};
    await API().Login(obj).then((response){
      print(response );
    });
  }
  void AddCount() {
    print('enter,$count');
    setState(() {
      count = count + 1;
    });
  }

  void DecreaseCount() {
    print('enter,$count');
    setState(() {
      count = count - 1;
    });
  }
  void changePercent(value) {
//    print('enter,$count');
    setState(() {
      percent = value;
    });
  }
  Future<File> _getLocalFile() async {
    // get the path to the document directory.
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/token.txt');
  }



  Future<Null> _setToken(token) async {
//    setState(() {
//      _counter++;
//    });
    // write the variable as a string to the file
    await (await _getLocalFile()).writeAsString('$token');
  }
  @override
  Widget build(BuildContext context) {
//    void onChanged() {
//
//    }


// ...

    return Scaffold(
        appBar: AppBar(
          title: Text('FormPage,count:$count'),
        ),
        body: Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Row(
            children: <Widget>[
            new FlatButton(
            child: Text('Increase'),
            onPressed: AddCount,
          ),
          new FlatButton(
            child: Text('Decrease'),
            onPressed: DecreaseCount,
          ),
          new Container(),
          ],
        ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                       Fluttertoast.showToast(msg: '请输入你的姓名');
                    }
                    if (value.length < 5) {
                      Fluttertoast.showToast(msg: '你太短了！');
                    }
                    return null;
                  },
                  //输入框改变触发onchange事件
                  onChanged: (res) => {print(res + 'datarrr')},
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    hintText: '请输入你的联系方式',
                  ),
                  validator: (value) {
                    if (value.length < 5) {
                      return '你太短了！';
                    }
                    return null;
                  },
                  //输入框改变触发onchange事件
                  onChanged: (res) => {print('当前输入：' + res)},
                ),
                 TextFormField(
                  decoration: const InputDecoration(
                    hintText: '请输入你的年龄',
                  ),
                 
                  validator: (value) {
                    print(value is String);
                    if (value is int != true) {
                      return '请输入数字';
                    }
                    return null;
                  },
                  //输入框改变触发onchange事件
                  onChanged: (res) => {print('当前输入：' + res)},
                ),
                Switch(value: _open, onChanged: (value) =>{
                  setState((){
                    _open = !_open;
                    print(_open);
                    print(value);
                    print('dskjflajfk');
                  })
                }),
                Checkbox(value: checkValue, onChanged: (value)=>{
                  setState((){
                    checkValue = !checkValue;
                  })
                }),
                Column(children: <Widget>[
                  ListTile(
                    title: const Text('Lafayette'),
                    leading: Radio(
                      value: ['first', 'second', 'third'],
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ]),
                Slider(
                  value: percent,
                  onChanged: (value) =>{
                    print(value),
                   setState((){
                     percent = value;
                     print(percent);
                   })
                  },
                  min: 0,
                  max: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.

                      if (_formKey.currentState.validate()) {
                        // Process data.
                        login();
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
