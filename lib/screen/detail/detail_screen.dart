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
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        width: MediaQuery.of(context).size.width,
                        // height: 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Repo Name
                            Text(
                              name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),

                            /// Repo Description
                            description.isEmpty
                                ? const SizedBox()
                                : Text(
                                    description,
                                    maxLines: 3,
                                    style: const TextStyle(fontSize: 17),
                                  ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                /// Repo StargazersCount
                                const Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  stargazersCount.toString(),
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(width: 10),

                                /// Repo Used Language
                                language.isEmpty
                                    ? const SizedBox()
                                    : const Icon(
                                        size: 14,
                                        Icons.circle_rounded,
                                        color: Colors.greenAccent,
                                      ),
                                language.isEmpty
                                    ? const SizedBox()
                                    : const SizedBox(width: 5),
                                language.isEmpty
                                    ? const SizedBox()
                                    : Text(
                                        language,
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 17,
                                        ),
                                      )
                              ],
                            )
                          ],
                        ),
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
