import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fave_book_request_body.g.dart';

@JsonSerializable(createToJson: true, explicitToJson: true)
class FaveBookWrapperRequestBody extends Equatable {
  final FaveBookRequestBody data;

  const FaveBookWrapperRequestBody({
    required this.data,
  });

  factory FaveBookWrapperRequestBody.fromJson(Map<String, dynamic> json) =>
      _$FaveBookWrapperRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$FaveBookWrapperRequestBodyToJson(this);

  @override
  List<Object?> get props => [data];
}

@JsonSerializable(createToJson: true)
class FaveBookRequestBody extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String authors;
  final String? coverImageUrl;
  final String? coverThumbnailUrl;
  final int pageCount;
  final int ratingCount;
  final int averageRating;
  final String releaseYear;
  final String? faveId;

  const FaveBookRequestBody({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.authors,
    required this.coverImageUrl,
    required this.coverThumbnailUrl,
    required this.pageCount,
    required this.ratingCount,
    required this.averageRating,
    required this.releaseYear,
    required this.faveId,
  });

  factory FaveBookRequestBody.fromJson(Map<String, dynamic> json) =>
      _$FaveBookRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$FaveBookRequestBodyToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        description,
        authors,
        coverImageUrl,
        coverThumbnailUrl,
        pageCount,
        ratingCount,
        averageRating,
        releaseYear,
        faveId,
      ];
}
