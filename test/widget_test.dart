import 'package:acote_github_user_list_app/screen/home/widget/ad_banner_widget.dart';
import 'package:acote_github_user_list_app/screen/home/widget/user_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreen Widget Test', () {
    testWidgets('User Profile Widget Test', (tester) async {
      String userId = 'testName';
      String userAvatarUrl = 'https://example.com/testName.png';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserProfile(userId: userId, userAvatarUrl: userAvatarUrl),
          ),
        ),
      );
      expect(find.text(userId), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
    testWidgets('AdBanner Widget Test', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AdBanner(),
          ),
        ),
      );
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
    });
  });
}
