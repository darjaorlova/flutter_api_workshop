// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fave_book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaveBookResponse _$FaveBookResponseFromJson(Map<String, dynamic> json) =>
    FaveBookResponse(
      id: json['id'] as String,
      data: FaveBookDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

FaveBookDataResponse _$FaveBookDataResponseFromJson(
        Map<String, dynamic> json) =>
    FaveBookDataResponse(
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
