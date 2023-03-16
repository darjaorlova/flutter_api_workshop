import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/features/books/data/book.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_details_number_segment_item.dart';

class BookDetailsNumbersSegment extends StatelessWidget {
  final Book book;

  const BookDetailsNumbersSegment({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: BookDetailsNumberSegmentItem(
              title: 'Released',
              count: book.releaseYear,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: BookDetailsNumberSegmentItem(
              title: 'Pages',
              count: book.pageCount.toString(),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: BookDetailsNumberSegmentItem(
              title: 'Rating',
              count: book.averageRating.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
