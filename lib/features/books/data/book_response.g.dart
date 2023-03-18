// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookItemsResponse _$BookItemsResponseFromJson(Map<String, dynamic> json) =>
    BookItemsResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => BookResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

BookResponse _$BookResponseFromJson(Map<String, dynamic> json) => BookResponse(
      id: json['id'] as String?,
      etag: json['etag'] as String?,
      selfLink: json['selfLink'] as String?,
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfoResponse.fromJson(
              json['volumeInfo'] as Map<String, dynamic>),
    );

VolumeInfoResponse _$VolumeInfoResponseFromJson(Map<String, dynamic> json) =>
    VolumeInfoResponse(
      title: json['title'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      description: json['description'] as String?,
      pageCount: json['pageCount'] as int?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      ratingsCount: json['ratingsCount'] as int?,
      maturityRating: json['maturityRating'] as String?,
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinksResponse.fromJson(
              json['imageLinks'] as Map<String, dynamic>),
      language: json['language'] as String?,
      subtitle: json['subtitle'] as String?,
    );

ImageLinksResponse _$ImageLinksResponseFromJson(Map<String, dynamic> json) =>
    ImageLinksResponse(
      smallThumbnail: json['smallThumbnail'] as String?,
      thumbnail: json['thumbnail'] as String?,
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
      extraLarge: json['extraLarge'] as String?,
    );
