import 'package:acote_github_user_list_app/screen/home/data/user_data.dart';
import 'package:acote_github_user_list_app/screen/home/widget/ad_banner_widget.dart';
import 'package:acote_github_user_list_app/screen/home/widget/user_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with UserDataProvider {
  @override
  void initState() {
    super.initState();
    Get.put(UserData());
    userData.getUserInfosData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'AcoteHub',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: Obx(
            () {
              if (userData.userInfos.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.separated(
                controller: userData.scrollController,
                itemCount: userData.userInfos.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                  height: 0.1,
                ),
                itemBuilder: (context, index) {
                  if ((index + 1) % 10 == 0) {
                    return const AdBanner();
                  }
                  final String userId = userData.userInfos[index]['userId'];
                  final String userAvatarUrl =
                      userData.userInfos[index]['userAvatarUrl'];
                  final String userRepoUrl =
                      userData.userInfos[index]['reposUrl'];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                userRepoUrl: userRepoUrl,
                                userName: userId,
                              )));
                    },
                    child: UserProfile(
                      userId: userId,
                      userAvatarUrl: userAvatarUrl,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
