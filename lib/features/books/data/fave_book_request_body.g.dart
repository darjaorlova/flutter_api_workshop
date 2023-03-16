// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fave_book_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaveBookWrapperRequestBody _$FaveBookWrapperRequestBodyFromJson(
        Map<String, dynamic> json) =>
    FaveBookWrapperRequestBody(
      data: FaveBookRequestBody.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FaveBookWrapperRequestBodyToJson(
        FaveBookWrapperRequestBody instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

FaveBookRequestBody _$FaveBookRequestBodyFromJson(Map<String, dynamic> json) =>
    FaveBookRequestBody(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      authors: json['authors'] as String,
      coverImageUrl: json['coverImageUrl'] as String?,
      coverThumbnailUrl: json['coverThumbnailUrl'] as String?,
      pageCount: json['pageCount'] as int,
      ratingCount: json['ratingCount'] as int,
      averageRating: json['averageRating'] as int,
      releaseYear: json['releaseYear'] as String,
      faveId: json['faveId'] as String?,
    );

Map<String, dynamic> _$FaveBookRequestBodyToJson(
        FaveBookRequestBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'authors': instance.authors,
      'coverImageUrl': instance.coverImageUrl,
      'coverThumbnailUrl': instance.coverThumbnailUrl,
      'pageCount': instance.pageCount,
      'ratingCount': instance.ratingCount,
      'averageRating': instance.averageRating,
      'releaseYear': instance.releaseYear,
      'faveId': instance.faveId,
    };
