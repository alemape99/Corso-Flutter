import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/post.dart';
import 'package:social_app/models/post_response.dart';


class ApiPost{
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<PostResponse> getPostList({int page = 0, int limit = 20}) async {

    final response = await http.get(
        Uri.parse('$baseUrl/post?page=$page&limit=$limit'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11'});

    if(response.statusCode == 200){
      return PostResponse.fromJson(jsonDecode(response.body)
      );
    }
    throw Exception(
        'Errore in ricevere gli utenti:'
            '${response.body} ');
  }
  static Future<Post> getDeatilsFor(String id ) async {
    final response = await http.get(Uri.parse('$baseUrl/post/$id'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11'});

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }
  static Future<Post> getDeatilsForUser(String id ) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$id/post'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11',});

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }
}