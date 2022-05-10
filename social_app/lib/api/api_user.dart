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


  static Future<User> getDeatilsFor(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$id'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11'});


    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere gli utenti:'
        '${response.body} ');
  }

  static Future<User> addUser(User user) async {

    Map<String, dynamic> _jsonUser = user.toJson();
    _jsonUser.removeWhere((key, value) => value == null);

    final response = await http.post(Uri.parse('$baseUrl/user/create'),
      headers: {
        'app-id': '626fc92ee000f64b3bf05f11',
        'Content-Type': 'application/json'
      },
      body:
      jsonEncode({
        _jsonUser
      }),
    );
    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception('User non inserito:'
        '${response.body} ');
  }

  static Future<User> modifiyUser(User user) async {
    if(user.id == null){
      throw Exception('Impossibile modificare utente');
    }
    Map<String, dynamic> _jsonUser = user.toJson();
    _jsonUser.removeWhere((key, value) => value == null);

    final response = await http.put(Uri.parse('$baseUrl/user/${user.id}'),
      headers: {
        'app-id': '626fc92ee000f64b3bf05f11',
        'Content-Type': 'application/json'
      },
      body:
      jsonEncode(
        _jsonUser
      ),
    );
    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception('User non modificato:'
        '${response.body} ');
  }

  static Future<bool> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/user/$id'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11'});


    if (response.statusCode == 200) {
      return true;
    }
    throw Exception('Impossibile rimuovere utente:'
        '${response.body} ');
  }



}
