import 'package:social_app/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable(
    explicitToJson: true
)
class ListUserResponse {
  final List<User> data;
  final int total;
  final int page;
  final int limit;

  ListUserResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.limit
});
  factory ListUserResponse.fromJson(Map<String, dynamic> json) => _$ListUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListUserResponseToJson(this);

}