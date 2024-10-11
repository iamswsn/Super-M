import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://supermarket.jerucloud.com/api/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String url,
        String?token,
      }) async {
    dio.options.headers={
      'token':token??'',
      'Accept-Language':'en'
    };
    return await dio.get(url);
  }

  static Future<Response> getDataWithBearerToken(
      {required String url,
        String?token,
      }) async {
    dio.options.headers={
      'token':token??'',
      'Accept-Language':'en',
      'Authorization': "Bearer " + token.toString(),
      'Connection':'keep-alive',
    };
    return await dio.get(url);
  }




  static Future<Response> postData(
      {required String url,
        dynamic ? length,
        // String?token,
        //  String ?image,
        // Map<String, dynamic>? query,
        required var data}) async {
    dio.options.headers={

//      'Content-Type':'multipart/form-data',

      //   'Content-Length':length,

    };
    return await dio.post(url, data: data);
  }

  static Future<Response> deleteData(
      {required String url,String ?token}) async {
    dio.options.headers={
      'Authorization': "Bearer " + token.toString(),
      'Accept':"application/json",
      'Connection': 'keep-alive',
      'Content-Type':'application/json',
      // 'Accept-Encoding':'gzip, deflate, br',
    };

    return await dio.delete(url,options: Options(
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    }));
  }

  static Future<Response> postDataWithBearearToken(
      {required String url,
        String?token,
        dynamic ? length,
        //  String ?image,
        // Map<String, dynamic>? query,
        required var data}) async {
    dio.options.headers={
      // 'token':token??'',
      'Authorization': "Bearer " + token.toString(),
      'Accept':"application/json",
      'Connection': 'keep-alive',
      'Content-Type':'application/json',
      // "X-Requested-With":"XMLHttpRequest",
      //'Accept':'*/*',
      // 'Content-Length':0,
    };
    return await dio.post(url, data: data,options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        }));
  }

  static Future<Response> putDataWithBearearToken(
      {required String url,
        String?token,
        dynamic ? length,

      }) async {
    dio.options.headers={
      // 'token':token??'',
      'Authorization': "Bearer " + token.toString(),
      'Accept':"application/json",
      'Connection': 'keep-alive',
      'Content-Type':'application/json',
      // "X-Requested-With":"XMLHttpRequest",
      //'Accept':'*/*',
      // 'Content-Length':0,
    };
    return await dio.put(url,options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        }));
  }


  static Future<Response> postDataWithImage(
      {required String url,
        dynamic ? length,

        String?token,
        required var data}) async {
    dio.options.headers={

      // 'Accept':"*/*",
      'Authorization': "Bearer " + token.toString(),
      'Accept':"application/json",
      'Content-Type':'multipart/form-data',
      //'Connection': 'keep-alive',
      'Content-Length':length,
    };
    return await dio.post(url, data: data,options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        }));
  }
}

