
import 'package:app/model/home.dart';
import 'package:app/model/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final Routers ={
  '/':(context) =>Home(),
  '/list':(context,{arguments}) =>List(arguments:arguments)
};
var onGenerateRoute =(RouteSettings settings){
  final String name = settings.name;
  final Function pageContentBuilder = Routers[name];
  if(pageContentBuilder != null) {
    if(settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context,arguments:settings.arguments)
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context)
      );
          return route;
    }
  }
};