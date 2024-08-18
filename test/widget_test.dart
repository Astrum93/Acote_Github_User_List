import 'package:acote_github_user_list_app/screen/home/widget/user_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
}
