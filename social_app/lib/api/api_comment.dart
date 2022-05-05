import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/comment.dart';
import 'package:social_app/models/comment_response.dart';

class ApiComment {
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<CommentResponse> getUserList(
      {int page = 0, int limit = 20}) async {
    final response = await http
        .get(Uri.parse('$baseUrl/comment?page=$page&limit=$limit'), headers: {
      'app-id': '626fc92ee000f64b3bf05f11',
    });

    if (response.statusCode == 200) {
      return CommentResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere il commento:'
        '${response.body} ');
  }

  static Future<CommentResponse> getCommentsFromPost(String id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/post/$id/comment'), headers: {
      'app-id': '626fc92ee000f64b3bf05f11',
    });

    if (response.statusCode == 200) {
      return CommentResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere il commento:'
        '${response.body} ');
  }

  static Future<CommentResponse> getCommentsFromUsers(String id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/user/$id/comment'), headers: {
      'app-id': '626fc92ee000f64b3bf05f11',
    });

    if (response.statusCode == 200) {
      return CommentResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere il commento:'
        '${response.body} ');
  }

  /* modo manuale

  static Future<Comment> addCommentTo(String postId, String message) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userId = sp.getString('loggedUserId');

    if (userId == null) {
      throw Exception(
          'Impossibile inserire un commento, per favore fai il login');
    }

    final response = await http.post(Uri.parse('$baseUrl/comment/create'),
        headers: {
          'app-id': '626fc92ee000f64b3bf05f11',
          'Content-Type': 'application/json'
        },
        body:
            jsonEncode({
              'owner': userId,
              'post': postId,
              'message': message}
            ),
    );
    if(response.statusCode == 200){
      return Comment.fromJson(jsonDecode(response.body));
    }
    throw Exception('Commento non inserito:'
    '${response.body} ');
  }*/

  static Future<Comment> addCommentTo(Comment comment) async {

    Map<String, dynamic> _jsonComment = comment.toJson();
    _jsonComment.removeWhere((key, value) => value == null);

    final response = await http.post(Uri.parse('$baseUrl/comment/create'),
      headers: {
        'app-id': '626fc92ee000f64b3bf05f11',
        'Content-Type': 'application/json'
      },
      body:
      jsonEncode({
        _jsonComment
      }),
    );
    if(response.statusCode == 200){
      return Comment.fromJson(jsonDecode(response.body));
    }
    throw Exception('Commento non inserito:'
        '${response.body} ');
  }
  static Future<Comment> deleteComment(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/comment/$id'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11'});


    if (response.statusCode == 200) {
      return Comment.fromJson(jsonDecode(response.body));
    }
    throw Exception('Impossibile rimuovere commento:'
        '${response.body} ');
  }
}
