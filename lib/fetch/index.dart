import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
String _token = '';
void getToken () async {
 _token = await _readToken();

}
Future<File> _getFile() async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  return new File('$dir/token.txt');
}
Future<String> _readToken() async {
  try {
    File file = await _getFile();
    // read the variable as a string from the file.
    String contents = await file.readAsString();
    return contents;
  } on FileSystemException {
    return '';
  }
}
class Fetch {
  static final Fetch _singleton = Fetch._init();
  static Dio _dio;

  /// 是否是debug模式.
  static bool _isDebug = true;

  /// 打开debug模式.
  static void openDebug() {
    _isDebug = true;
  }

  Fetch._init() {
/**
 * baseUrl
 * 连接超时
 * 接收超时
 * _dio 配置过后的dio
 * **/
    BaseOptions options = new BaseOptions(
      baseUrl: "https://admin.xuegongbang.cn/admin",
      connectTimeout: 1000 * 10,
      receiveTimeout: 1000 * 20,
    );
    _dio = Dio(options);
    _dio.options.contentType = 'application/json';
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      // config the http client
//      client.findProxy = (uri) {
//        //proxy all request to localhost:8888
//        return "PROXY 192.168.1.138:8889";
//      };
      // you can also create a new HttpClient to dio
      // return new HttpClient();
    };
  }

  factory Fetch() {
    return _singleton;
  }

  /// Make http request with options.
  /// [method] The request method.
  /// [path] The url path.
  /// [data] The request data
  /// [options] The request options.
  /// String 返回 json data .
  Future<Map> request<T>(
      String path, {
        String method ,
        queryParameters,
        Options options,
        CancelToken cancelToken,
      })
  async {

    Response response = await _dio.request(
      path,
      queryParameters: queryParameters,
      data: queryParameters,
      options: _checkOptions(method, options),
      cancelToken: cancelToken,
    );
    _printHttpLog(response);
    if (response.statusCode == 200) {
      try {
        if (response.data is Map) {
          if (response.data["code"] != 200 ) {
            Fluttertoast.showToast(msg: response.data["msg"], fontSize: 14.0);
            return new Future.error(new DioError(
              response: response,
//              message: response.data["msg"],
              type: DioErrorType.RESPONSE,
            ));
          }

          return response.data;
        } else {
          if (response.data is List) {
            /** 将响应转成Map **/
            Map<String, dynamic> _dataMap = Map();
            _dataMap["data"] = response.data;
            return _dataMap;
          }
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "网络连接不可用，请稍后重试", fontSize: 14.0);
        return new Future.error(new DioError(

          response: response,
//          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }
    Fluttertoast.showToast(msg: "网络连接不可用，请稍后重试", fontSize: 14.0);
    return new Future.error(new DioError(
      response: response,
//      message: "statusCode: ${response.statusCode}, service error",
      type: DioErrorType.RESPONSE,
    ));
  }

  /// check Options.
  Options _checkOptions(method, options) {
    if (options == null) {
      options = new Options();
    }
    options.method = method ;
    options.headers['token'] = _token;
//    options.headers['content-type'] = 'application/json';
    return options;
  }

  /// print Http Log.
  void _printHttpLog(Response response) {
    if (!_isDebug) {
      return;
    }
    try {
      print("----------------Http Log Start----------------" +
          "\n[statusCode]:   " +
          response.statusCode.toString() +
          "\n[request   ]:   " +
          _getOptionsStr(response.request));
//      _printDataStr("reqdata ", response.request.data);
//      _printDataStr("queryParameters ", response.request.queryParameters);
//      _printDataStr("response", response.data);
//      print("----------------Http Log Stop----------------");
    } catch (ex) {
      print("Http Log" + " error......");
    }
  }

  /// get Options Str.
  String _getOptionsStr(RequestOptions request) {
    return "method: " +
        request.method +
        "  baseUrl: " +
        request.baseUrl +
        "  path: " +
        request.path;
  }

  /// print Data Str.
  void _printDataStr(String tag, Object value) {
    String da = value.toString();
    while (da.isNotEmpty) {
      if (da.length > 512) {
        print("[$tag  ]:   " + da.substring(0, 512));
        da = da.substring(512, da.length);
      } else {
        print("[$tag  ]:   " + da);
        da = "";
      }
    }
  }
}

/// <BaseRespR<T> 返回 status code msg data Response.
class BaseRespR<T> {
  String status;
  int code;
  String msg;
  T data;
  Response response;

  BaseRespR(this.status, this.code, this.msg, this.data, this.response);

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"status\":\"$status\"");
    sb.write(",\"code\":$code");
    sb.write(",\"msg\":\"$msg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

abstract class DioCallback<T> {
  void onSuccess(T t);

  void onError(DioError error);
}

/// 请求方法.
class Method {
  static const String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}


