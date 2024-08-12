import 'package:acote_github_user_list_app/service/github_api/github_api_service.dart';
import 'package:get/get.dart';

abstract mixin class UserDataProvider {
  late final userData = Get.find<UserData>();
}

class UserData extends GetxController with UserDataProvider {
  RxList userInfos = [].obs;

  Future getUserInfosData() async {
    final response = await GithubApiService.getUserInfos();

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
