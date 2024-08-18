import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_user_data_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('GithubApi Test', () {
    final dio = MockDio();

    /// User Data Fetch Test
    test('Github User Data Fetch', () async {
      final mockData = [
        {
          'login': 'user1',
          'avatar_url': 'https://example.com/user1.png',
          'repos_url': 'https://api.github.com/users/user1/repos'
        },
        {
          'login': 'user2',
          'avatar_url': 'https://example.com/user2.png',
          'repos_url': 'https://api.github.com/users/user2/repos'
        }
      ];
      when(dio.get('https://api.github.com/users')).thenAnswer(
        (_) async => Future.value(
          Response(
              data: mockData,
              statusCode: 200,
              requestOptions: RequestOptions(path: '')),
        ),
      );
      final response = await fetchUserData(dio);
      expect(response.data, mockData);
    });

    /// User Repos Data Fetch Test
    test('Fetch Github User Repos Data Fetch', () async {
      final mockRepoData = [
        {
          'name': 'repo1',
          'description': 'This is repo1',
          'stargazers_count': 100,
          'language': 'Dart',
          'private': false,
        },
        {
          'name': 'repo2',
          'description': 'This is repo2',
          'stargazers_count': 200,
          'language': 'Flutter',
          'private': true,
        }
      ];

      when(dio.get('https://api.github.com/users/mojombo/repos')).thenAnswer(
        (_) async => Future.value(
          Response(
            data: mockRepoData,
            statusCode: 200,
            requestOptions: RequestOptions(
                path: 'https://api.github.com/users/mojombo/repos'),
          ),
        ),
      );

      final response = await fetchUserReposData(dio);
      expect(response.data, mockRepoData);
    });
  });
}

Future fetchUserData(Dio dio) async {
  final response = await dio.get('https://api.github.com/users');
  if (response.statusCode == 200) {
    return response;
  }
}

Future fetchUserReposData(Dio dio) async {
  final response = await dio.get('https://api.github.com/users/mojombo/repos');
  if (response.statusCode == 200) {
    return response;
  }
}
