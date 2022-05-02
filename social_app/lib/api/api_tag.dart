import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/tag_response.dart';

class ApiTag{
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<TagResponse> getUserList({int page = 0, int limit = 20}) async {

    final response = await http.get(
        Uri.parse('$baseUrl/tag?page=$page&limit=$limit'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11',});

    if(response.statusCode == 200){
      return TagResponse.fromJson(jsonDecode(response.body)
      );
    }
    throw Exception(
        'Errore in ricevere gli utenti:'
            '${response.body} ');
  }
}