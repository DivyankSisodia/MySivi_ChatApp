import 'package:dio/dio.dart';

class ChatApiService {
  final Dio _dio = Dio();
  static const String _baseUrl = 'https://dummyjson.com';

  /// Fetches comments to simulate receiver messages.
  /// Returns a list of message strings or objects.
  Future<List<Map<String, dynamic>>> getReceiverMessages({int limit = 10}) async {
    try {
      final response = await _dio.get('$_baseUrl/comments', queryParameters: {'limit': limit});
      
      if (response.statusCode == 200) {
        final data = response.data;
        final comments = data['comments'] as List;
        
        return comments.map((comment) => {
          'id': comment['id'],
          'body': comment['body'],
          'user': comment['user']['username'], // sender username
        }).toList();
      } else {
        throw Exception('Failed to load messages');
      }
    } catch (e) {
      throw Exception('Error handling request: $e');
    }
  }
}
