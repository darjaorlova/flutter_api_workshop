import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/design_system/app_theme.dart';
import 'package:flutter_api_workshop/features/books/data/book.dart';
import 'package:flutter_api_workshop/features/books/data/books_repository.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_details_page.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_list_item.dart';

class FaveBooksPage extends StatefulWidget {
  final BooksRepository booksRepository;

  const FaveBooksPage({
    Key? key,
    required this.booksRepository,
  }) : super(key: key);

  @override
  State<FaveBooksPage> createState() => _FaveBooksPageState();
}

class _FaveBooksPageState extends State<FaveBooksPage> {
  Future<List<Book>>? _booksFuture;

  @override
  void initState() {
    super.initState();
    _booksFuture = widget.booksRepository.getFaveBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Fave books',
                  style: TextStyle(
                    fontFamily: AppTheme.accentFontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            FutureBuilder<List<Book>>(
              future: _booksFuture,
              builder: (context, snapshot) {
                print(snapshot.error);
                if (snapshot.hasError) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'Something went wrong, try adding some to faves',
                        style: TextStyle(
                          fontFamily: AppTheme.accentFontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                if (!snapshot.hasData) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final books = snapshot.data ?? [];

                if (books.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'No books found, try another query',
                        style: TextStyle(
                          fontFamily: AppTheme.accentFontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final book = books[index];
                      return BookListItem(
                        book: book,
                        onOpenBookDetails: _openBookDetails,
                      );
                    },
                    childCount: books.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openBookDetails(Book book) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(
          booksRepository: widget.booksRepository,
          bookId: book.id,
          faveId: book.faveId,
        ),
      ),
    );
    setState(() {
      _booksFuture = widget.booksRepository.getFaveBooks();
    });
  }
}
