import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/comment.dart';
import 'package:social_app/models/comment_response.dart';

class ApiComment {
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<CommentResponse> getUserList({int page = 0, int limit = 20}) async {
    final response = await http.get(Uri.parse('$baseUrl/comment?page=$page&limit=$limit'), headers: {
      'app-id': '626fc92ee000f64b3bf05f11',
    });

    if (response.statusCode == 200) {
      return CommentResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }
  static Future<CommentResponse> getCommentsFromPost(String id ) async {
    final response = await http.get(Uri.parse('$baseUrl/post/$id/comment'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11',});

    if (response.statusCode == 200) {
      return CommentResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }
  static Future<CommentResponse> getCommentsFromUsers(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$id/comment'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11',});

    if (response.statusCode == 200) {
      return CommentResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }
}
