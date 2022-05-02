// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as String,
      message: json['message'] as String?,
      owner: json['owner'] as String?,
      post: json['post'] as String?,
      publishDate: json['publishDate'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'owner': instance.owner,
      'post': instance.post,
      'publishDate': instance.publishDate,
    };
