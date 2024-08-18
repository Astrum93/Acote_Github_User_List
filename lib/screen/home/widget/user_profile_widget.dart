import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String userId;
  final String userAvatarUrl;

  const UserProfile({
    super.key,
    required this.userId,
    required this.userAvatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// 프로필 사진
          userAvatarUrl.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : CircleAvatar(
                  radius: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      userAvatarUrl,
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// 유저 ID
              Text(
                userId,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
