import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/design_system/app_theme.dart';
import 'package:flutter_api_workshop/features/books/data/book.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_list_item_rating.dart';

class BookListItemInfo extends StatelessWidget {
  final Book book;

  const BookListItemInfo({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.title,
            style: const TextStyle(
              fontFamily: AppTheme.accentFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            book.authors,
            maxLines: 1,
            style: const TextStyle(
              fontFamily: AppTheme.primaryFontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          const SizedBox(
            height: 4,
          ),
          BookRating(
            averageRating: book.averageRating,
            totalCount: book.ratingCount,
          ),
        ],
      ),
    );
  }
}
