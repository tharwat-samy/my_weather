import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api {
  final _baseUrl = 'http://api.weatherapi.com/v1/';
  final _apiKey = '3677bed892474b30b7a122242220806';

  Future<Response> get(
      {required String endPoint,
      userToken,
      String? lang,
      bool isBaseUrl = true}) async {
    log('Calling $_baseUrl$endPoint , with token $userToken');

    Map<String, dynamic> headers = {};

    if (userToken != null) {
      headers.addAll({'Authorization': 'Bearer $userToken'});
    }
    if (lang != null) {
      headers.addAll({'Accept-Language': lang});
    }

    var response = await Dio()
        .get('$_baseUrl$endPoint', options: Options(headers: headers));

    return response;
  }
}
