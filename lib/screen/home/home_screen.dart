import 'package:acote_github_user_list_app/screen/home/widget/ad_banner_widget.dart';
import 'package:acote_github_user_list_app/screen/home/widget/user_profile_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          body: ListView.separated(
            itemCount: 60,
            separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
              height: 0.1,
            ),
            itemBuilder: (context, index) {
              if ((index + 1) % 10 == 0) {
                return const AdBanner();
              }
              return const UserProfile();
            },
          ),
        ),
      ),
    );
  }
}
