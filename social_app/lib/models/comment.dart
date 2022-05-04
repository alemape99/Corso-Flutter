import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment{
  final String id;
  final String message;
  final String owner;
  final String post;
  final String publishDate;

  Comment({
    required this.id,
    required this.message,
    required this.owner,
    required this.post,
    required this.publishDate,
});
  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

}