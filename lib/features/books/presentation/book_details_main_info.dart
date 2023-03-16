import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/design_system/app_theme.dart';
import 'package:flutter_api_workshop/features/books/data/book.dart';

class BookDetailsMainInfo extends StatelessWidget {
  final Book book;

  const BookDetailsMainInfo({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    color: AppTheme.grayDark,
                    fontFamily: AppTheme.accentFontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                  maxLines: 4,
                ),
                Text(
                  book.subtitle,
                  style: const TextStyle(
                    color: AppTheme.grayDark,
                    fontFamily: AppTheme.accentFontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  maxLines: 4,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  book.authors,
                  style: const TextStyle(
                    color: AppTheme.accentColor,
                    fontFamily: AppTheme.primaryFontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
