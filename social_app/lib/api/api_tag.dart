import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/tag_response.dart';

class ApiTag{
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<TagResponse> getTagList({int page = 0, int limit = 20}) async {

    final response = await http.get(
        Uri.parse('$baseUrl/tag?page=$page&limit=$limit'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11',});

    if(response.statusCode == 200){
      return TagResponse.fromJson(jsonDecode(response.body)
      );
    }
    throw Exception(
        'Errore in ricevere i tag:'
            '${response.body} ');
  }
  static Future<TagResponse> getPostfotTag(String tags ) async {
    final response = await http.get(Uri.parse('$baseUrl/tag/$tags/post'),
        headers: {'app-id': '626fc92ee000f64b3bf05f11',});

    if (response.statusCode == 200) {
      return TagResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in ricevere i tag:'
        '${response.body} ');
  }

}