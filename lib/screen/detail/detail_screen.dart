import 'package:acote_github_user_list_app/screen/detail/widget/repo_profile_widget.dart';
import 'package:acote_github_user_list_app/screen/home/data/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  final String userRepoUrl;
  final String userName;

  const DetailScreen({
    super.key,
    required this.userRepoUrl,
    required this.userName,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with UserDataProvider {
  _DetailScreenState();

  @override
  void initState() {
    super.initState();
    Get.put(UserData());
    userData.getUserReposData(widget.userRepoUrl);
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<UserData>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Repo 소유자 Name
              Text(
                widget.userName,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '리포지토리',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            Expanded(
              child: Obx(
                () {
                  if (userData.userRepos.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.separated(
                    itemCount: userData.userRepos.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                      height: 0.1,
                    ),
                    itemBuilder: (context, index) {
                      final repo = userData.userRepos[index];
                      final String name = repo['name'] ?? 'No name';
                      final String description = repo['description'] ?? '';
                      final int stargazersCount = repo['stargazersCount'] ?? 0;
                      final String language = repo['language'] ?? '';
                      final bool private = repo['private'] ?? false;
                      return RepoProfile(
                        name: name,
                        description: description,
                        stargazersCount: stargazersCount,
                        language: language,
                        private: private,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
