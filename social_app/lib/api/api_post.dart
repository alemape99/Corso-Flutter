import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/post_response.dart';

class ApiPost {
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<PostResponse> getPostList(
      {int page = 0, int limit = 20}) async {
    final response = await http.get(
        Uri.parse('$baseUrl/post?page=$page&limit=$limit'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11'});

    if (response.statusCode == 200) {
      return PostResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere il post:'
        '${response.body} ');
  }

  static Future<Post> getDeatilsFor(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/post/$id'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11'});

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere il post:'
        '${response.body} ');
  }

  static Future<PostResponse> getDeatilsForUser(String id,
      {int page = 0, int limit = 20}) async {
    final response =
        await http.get(Uri.parse('$baseUrl/user/$id/post'), headers: {
      'app-id': '626fc92ee000f64b3bf05f11',
    });

    if (response.statusCode == 200) {
      return PostResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere il post :'
        '${response.body} ');
  }

  static Future<Post> addPost(Post post, String userId) async {
    Map<String, dynamic> _jsonPost = post.toJson();
    _jsonPost.removeWhere((key, value) => value == null);

    SharedPreferences sp = await SharedPreferences.getInstance();
    final _idUser = sp.getString('loggedUserId');
    if (_idUser == null) {
      throw Exception('Utente non loggato');
    } else {
      _jsonPost['owner'] = _idUser;
    }

    final response = await http.post(
      Uri.parse('$baseUrl/post/create'),
      headers: {
        'app-id': '626fc92ee000f64b3bf05f11',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(_jsonPost),
    );
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception('Post non inserito:'
        '${response.body} ');
  }

  static Future<Post> modifyPost(Post post, String userId) async {

    Map<String, dynamic> _jsonPost = post.toJson();
    _jsonPost.removeWhere((key, value) => value == null);

    SharedPreferences sp = await SharedPreferences.getInstance();
    final _idUser = sp.getString('loggedUserId');
    if (_idUser == null) {
      throw Exception('Utente non loggato');
    } else {
      _jsonPost['owner'] = _idUser;
    }

    final response = await http.put(
      Uri.parse('$baseUrl/post/${post.id}'),
      headers: {
        'app-id': '626fc92ee000f64b3bf05f11',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(_jsonPost),
    );
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception('Post non inserito:'
        '${response.body} ');
  }

  static Future<bool> deletePost(String postId) async {
    final response = await http.delete(Uri.parse('$baseUrl/post/$postId'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11'});

    if (response.statusCode == 200) {
      return true;
    }
    throw Exception('Impossibile rimuovere post:'
        '${response.body} ');
  }
}
