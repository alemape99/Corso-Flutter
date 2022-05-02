import 'dart:convert';

import 'package:social_app/models/user.dart';
import 'package:social_app/models/user_response.dart';
import 'package:http/http.dart' as http;

class ApiUser {
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<ListUserResponse> getUserList({int page = 0, int limit = 20}) async {
    final response = await http.get(Uri.parse('$baseUrl/user?page=$page&limit=$limit'), headers: {
      'app-id': '626fc92ee000f64b3bf05f11'});

    if (response.statusCode == 200) {
      return ListUserResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }

  static Future<User> getDeatilsFor(String id ) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$id'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11'});

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }
}
