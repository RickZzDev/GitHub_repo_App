import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ambar_test/app/routes/app_routes.dart';
import 'package:ambar_test/app/utils/api_utils/headers/headers.dart';

class Requester {
  Map basicHeaders = Headers.getBasicHeader();

  fetch({@required String url, Map header}) async {
    try {
      var response =
          await http.get(url, headers: header == null ? basicHeaders : header);

      verifyStatusCode(response);
      return response;
    } catch (e) {
      return e;
    }
  }

  verifyStatusCode(http.Response _response) {
    if (_response.statusCode < 200 || _response.statusCode > 300) {
      if (_response.statusCode == 401) {
        return Get.offAllNamed(Routes.SPLASHSCREEEN);
      }
      if (_response.body == null) {
        throw new Exception("Error while fetching data");
      } else {
        Map mapError = json.decode(utf8.decode(_response.bodyBytes));
        throw new Exception(mapError['message']);
      }
    }
  }
}
