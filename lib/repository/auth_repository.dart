import 'dart:convert';

import 'package:flutter_mvvm_provider/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm_provider/data/network/NetworkApiService.dart';
import 'package:flutter_mvvm_provider/resources/app_url.dart';
import 'package:http/http.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.loginEndPoint,
        data,
      );
      return response;
      // Response response = await post(
      //   Uri.parse("aaa"),
      //   body: {
      //     'dada': 'data',
      //   },
      // ).timeout(
      //   const Duration(seconds: 10,
      // ));
      // var data = jsonDecode(response.body);
      // if (response.statusCode == 200) {
      //   return data;
      // } else if (response.statusCode == 400) {
      //   return data;
      // }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.registerApiEndPoint,
        data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
