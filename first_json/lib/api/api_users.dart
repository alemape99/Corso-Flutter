import 'dart:convert';

import 'package:first_json/models/users_response.dart';
import 'package:http/http.dart' as http;

class ApiUsers{
  static Future<UserResponse> getUsersFromInternet({int skip = 0}) async{
    final response = await http.get(
        Uri.parse('https://dummyjson.com/users?skip?$skip'));

    if(response.statusCode == 200){
      return UserResponse.fromJson(jsonDecode(response.body)
      );
    }
    throw Exception(
        'Error getUsersFromInternet(): '
            '${response.statusCode} - '
            '${response.reasonPhrase}');
  }
}