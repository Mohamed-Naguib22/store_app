import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Api {
  final Dio dio;
  Api({required this.dio});

  Future<List<dynamic>> get({required String url}) async {
    var response = await dio.get(url);

    if (response.statusCode != 200) {
      throw Exception('There is a problem with status code ${response.statusCode}');
    }

    return response.data;
  }

  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
    @required String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers.addAll({'Authorization' : 'Bearer $token'});
    }

    var response = await dio.post(url, data: body, options: Options(headers: headers));

    if (response.statusCode != 200) {
      throw Exception('There is a problem with status code ${response.statusCode}');
    }

    return response.data;
  }

  Future<dynamic> put({
    required String url,
    required Map<String, dynamic> body,
    @required String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers.addAll({'Authorization' : 'Bearer $token'});
    }

    var response = await dio.put(url, data: body, options: Options(headers: headers));

    if (response.statusCode != 200) {
      throw Exception('There is a problem with status code ${response.statusCode}');
    }

    return response.data;
  }
}