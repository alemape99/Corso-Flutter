import 'package:social_app/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final String? id;
  final String? text;
  final String? image;
  final int? likes;
  final String? link;
  final List<String>? tags;
  final String? publishDate;
  final User? owner;

  Post({
    this.id,
    this.text,
    this.image,
    this.likes,
    this.link,
    this.tags,
    this.publishDate,
    this.owner
  });
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

}