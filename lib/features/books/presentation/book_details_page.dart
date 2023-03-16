import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/design_system/app_theme.dart';
import 'package:flutter_api_workshop/features/books/data/book.dart';
import 'package:flutter_api_workshop/features/books/data/books_repository.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_details_cover_image.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_details_description.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_details_main_info.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_details_numbers_segment.dart';

class BookDetailsPage extends StatefulWidget {
  final BooksRepository booksRepository;
  final String bookId;
  final String? faveId;

  const BookDetailsPage({
    Key? key,
    required this.booksRepository,
    required this.bookId,
    required this.faveId,
  }) : super(key: key);

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  Future<Book>? _bookFuture;

  @override
  void initState() {
    super.initState();
    _bookFuture = widget.booksRepository.getBook(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Book>(
      future: _bookFuture,
      builder: (context, snapshot) {
        Widget? child;
        if (snapshot.hasError) {
          child = const Center(
            child: Text('Error'),
          );
        }

        final book = snapshot.data;
        if (book == null) {
          child = const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          child = CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: BookDetailsCoverImage(
                  imageUrl: book.coverImageUrl ?? '',
                ),
              ),
              SliverToBoxAdapter(
                child: BookDetailsMainInfo(book: book),
              ),
              SliverToBoxAdapter(
                child: BookDetailsNumbersSegment(book: book),
              ),
              SliverToBoxAdapter(
                child: BookDetailsDescription(
                  description: book.description,
                ),
              ),
            ],
          );
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(color: AppTheme.grayDark),
            title: const Text(
              'Book Details',
              style: TextStyle(
                color: AppTheme.grayDark,
                fontFamily: AppTheme.accentFontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            backgroundColor: AppTheme.primaryColor,
            elevation: 0,
          ),
          backgroundColor: AppTheme.primaryColor,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (book != null) {
                final faveId = widget.faveId;
                if (faveId != null) {
                  widget.booksRepository.removeBookFromFaves(faveId);
                } else {
                  widget.booksRepository.addBookToFaves(book);
                }
              }
            },
            child: widget.faveId != null
                ? const Icon(Icons.favorite_sharp)
                : const Icon(Icons.favorite_border_sharp),
          ),
          body: child,
        );
      },
    );
  }
}
