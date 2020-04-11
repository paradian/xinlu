import 'package:flutter/material.dart';
class RequestPage extends StatelessWidget{
  RequestPage({this.arguments});
 final Map arguments;

  Widget build(BuildContext context){
    print(arguments);
    return Scaffold(
      appBar: AppBar(title:Text('FormPage'),backgroundColor: Colors.lightGreen,),
      body: Center (
        child:Text('FormPage ddidi',textAlign: TextAlign.left),



      ),
      backgroundColor: Colors.white,
    );


  }
}