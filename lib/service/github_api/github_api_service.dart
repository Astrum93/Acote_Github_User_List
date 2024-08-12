import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GithubApiService {
  /// 유저 정보를 불러 오는 메서드
  static Future getUserInfos() async {
    final dio = Dio();
    try {
      final response = await dio.get('https://api.github.com/users');
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        debugPrint("404 에러@@@ \n${e.response?.statusCode.toString()}");
      }
    }
  }
}
