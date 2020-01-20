import 'dart:async';
import 'package:dio/dio.dart';

import 'index.dart';

class API {
Future<Map> getList(method) async {
  return await Fetch().request<String>('https://www.apidevelop.com/subway/city/data.json',method: method);
}
Future<Map> login(url,method,data) async {
  return await Fetch().request('http://47.92.213.232:9007/admin',method: method,queryParameters: data);
}
}