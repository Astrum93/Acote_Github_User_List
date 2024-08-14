import 'package:acote_github_user_list_app/service/github_api/github_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract mixin class UserDataProvider {
  late final userData = Get.find<UserData>();
}

class UserData extends GetxController with UserDataProvider {
  final ScrollController scrollController = ScrollController();
  RxString since = ''.obs;
  RxList userInfos = [].obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  void _load() {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          getUserInfosData();
        }
      },
    );
  }

  Future getUserInfosData() async {
    /// response 생성
    final response = await GithubApiService.getUserInfos(since);

    /// header ['link'] 정의
    var linkHeader = response.headers['Link']?[0].toString();

    /// 조건부로 since 값 정의
    if (linkHeader != null && linkHeader.contains('rel="next"')) {
      RegExp regExp = RegExp(r'since=(\d+)');
      Match? match = regExp.firstMatch(linkHeader);
      since.value = match!.group(1)!;
    }

    /// Response -> List
    List data = response.data;

    /// Fetch한 데이터에서 유저 아이디와 사진만 가져오기
    for (var item in data) {
      final String userId = item['login'];
      final String userAvatarUrl = item['avatar_url'];
      Map<String, dynamic> userInfo = {
        'userId': userId,
        'userAvatarUrl': userAvatarUrl,
      };

      /// RxList에 추가
      userInfos.add(userInfo);
    }
    return userInfos;
  }
}
