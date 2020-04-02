import 'dart:io';
import 'dart:async';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';


class FlutterDemo extends StatefulWidget {
  FlutterDemo({Key key}) : super(key: key);

  @override
  _FlutterDemoState createState() => new _FlutterDemoState();
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

    return new Scaffold(
      appBar: new AppBar(title: new Text('Flutter Demo')),
      body: new Center(
        child:Column(
          children: <Widget>[
            new Text('Button tapped $_counter time${
                _counter == 1 ? '' : 's'
            }.'),
            new FlatButton(onPressed: _clearCounter, child: Text('clear')),
            Container(

                child:FlatButton(onPressed: counter.increment,child:  Text('value id ${counter.value}',style: TextStyle(fontSize: textSize,color: Colors.deepPurple)),),

            )
          ],
        )

      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child:

            new Icon(Icons.add),
//

      ),

    );
  }
}