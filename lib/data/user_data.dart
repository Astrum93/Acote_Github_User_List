import 'package:acote_github_user_list_app/service/github_api/github_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract mixin class UserDataProvider {
  late final userData = Get.find<UserData>();
}

class UserData extends GetxController with UserDataProvider {
  final ScrollController userInfoScrollController = ScrollController();
  final ScrollController repoInfoScrollController = ScrollController();

  RxString since = ''.obs;
  RxString nextRepoUrl = ''.obs;
  RxList userInfos = [].obs;
  RxList userRepos = [].obs;

  @override
  void onInit() {
    super.onInit();
    _userInfoLoad();
    _repoInfoLoad();
  }

  void _userInfoLoad() {
    userInfoScrollController.addListener(
      () {
        if (userInfoScrollController.position.pixels ==
            userInfoScrollController.position.maxScrollExtent) {
          getUserInfosData();
        }
      },
    );
  }

  void _repoInfoLoad() {
    repoInfoScrollController.addListener(
      () {
        if (repoInfoScrollController.position.pixels ==
            repoInfoScrollController.position.maxScrollExtent) {
          getUserReposData(nextRepoUrl.value);
        }
      },
    );
  }

  Future getUserInfosData() async {
    /// response 생성
    final response = await GithubApiService.getUserInfos(since);

    if (response != null) {
      /// header ['link'] 정의
      var linkHeader = response.headers['Link']?[0].toString();

      /// 조건부로 since 값 정의
      if (linkHeader != null && linkHeader.contains('rel="next"')) {
        /// 정규식 사용 'since=' 이후에 나오는 1개이상의 숫자.
        RegExp regExp = RegExp(r'since=(\d+)');
        Match? match = regExp.firstMatch(linkHeader);
        if (match != null) {
          since.value = match.group(1) ?? '';
        } else {
          since.value = '';
        }
      } else {
        return;
      }
    }

    /// Response -> List
    List data = response.data;

    /// Fetch한 데이터에서 유저 아이디와 사진만 가져오기
    for (var item in data) {
      final String userId = item['login'];
      final String userAvatarUrl = item['avatar_url'];
      final String reposUrl = item['repos_url'];
      Map<String, dynamic> userInfo = {
        'userId': userId,
        'userAvatarUrl': userAvatarUrl,
        'reposUrl': reposUrl,
      };

      /// RxList에 추가
      userInfos.add(userInfo);
    }
    return userInfos;
  }

  Future getUserReposData(url) async {
    final response = await GithubApiService.getUserRepos(url);

    if (response != null) {
      var linkHeader = response.headers['Link']?[0].toString();
      if (linkHeader != null && linkHeader.contains('rel="next"')) {
        /// < 와 >; rel="next" 사이의 문자열 (다음 페이지 url)을 추출
        RegExp regExp = RegExp(r'<([^>]+)>;\s*rel="next"');
        Match? match = regExp.firstMatch(linkHeader);
        if (match != null) {
          nextRepoUrl.value = match.group(1) ?? '';
          debugPrint(nextRepoUrl.value);
        }
      } else {
        nextRepoUrl.value = '';
      }
    } else {
      /// next url이 없어 response가 할당이 안될 경우
      return;
    }

    List repos = response.data;
    for (var repo in repos) {
      final String name = repo['name'];
      final String? description = repo['description'];
      final int? stargazersCount = repo['stargazers_count'];
      final String? language = repo['language'];
      final bool private = repo['private'];
      Map<String, dynamic> userRepoData = {
        'name': name,
        'description': description,
        'stargazersCount': stargazersCount,
        'language': language,
        'private': private,
      };
      userRepos.add(userRepoData);
    }
    return userRepos;
  }
}
