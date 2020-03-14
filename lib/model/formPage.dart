import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
final _formKey = GlobalKey<FormState>();

class FormPage extends StatefulWidget {
  @override
//  _FormPage  createState() => _FormPage();
  _Form1 createState() => _Form1();
}

class _FormPage extends State<FormPage> {
  int count = 0;
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
