import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_user_data_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  test('Github User Data Fetch', () async {
    final dio = MockDio();
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
}

Future fetchUserData(Dio dio) async {
  final response = await dio.get('https://api.github.com/users');
  if (response.statusCode == 200) {
    return response;
  }
}
