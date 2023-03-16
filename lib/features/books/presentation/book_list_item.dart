import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/features/books/data/book.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_list_item_cover.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_list_item_info.dart';

class BookListItem extends StatelessWidget {
  final Book book;
  final Function(Book book) onOpenBookDetails;

  const BookListItem({
    Key? key,
    required this.book,
    required this.onOpenBookDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpenBookDetails(book),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          children: [
            BookListItemCover(imageUrl: book.coverThumbnailUrl ?? ''),
            const SizedBox(width: 16),
            Expanded(
              child: BookListItemInfo(book: book),
            ),
          ],
        ),
      ),
    );
  }
}
