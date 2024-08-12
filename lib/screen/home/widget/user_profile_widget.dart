import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
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
          CircleAvatar(
            radius: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'https://placehold.it/500x100?text=ad',
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// 유저 ID
              Text(
                'userName',
                style: TextStyle(
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
