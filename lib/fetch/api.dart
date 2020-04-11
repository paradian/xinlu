import 'dart:async';

import 'index.dart';
class API {
Future<Map> getList(method) async {
  return await Fetch().request<String>('https://www.apidevelop.com/subway/city/data.json',method: method);
}
Future<Map> login(url,method,data) async {
  return await Fetch().request<String>('http://47.92.213.232:9007/admin',method: method,queryParameters: data);
}
Future<Map> nodeList() async {
  return await Fetch().request<String>('https://cnodejs.org/api/v1/topics',method: 'GET');
}
Future<Map> Login(data) async {
  return await Fetch().request("https://admin.xuegongbang.cn/admin/login",method:'POST',queryParameters:data);
}
}