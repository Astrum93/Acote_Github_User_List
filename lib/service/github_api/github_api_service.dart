import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GithubApiService {
  /// 유저 정보를 불러 오는 메서드
  static Future getUserInfos(since) async {
    final dio = Dio();

    try {
      String url = 'https://api.github.com/users';
      final response = await dio.get(
        url,
        queryParameters: {'since': since},
      );

      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        debugPrint("404 에러@@@ \n${e.response?.statusCode.toString()}");
      }
    }
  }
}
