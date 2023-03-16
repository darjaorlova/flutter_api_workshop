import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/design_system/app_theme.dart';
import 'package:flutter_api_workshop/design_system/sliver_search_app_bar.dart';
import 'package:flutter_api_workshop/features/books/data/book.dart';
import 'package:flutter_api_workshop/features/books/data/books_repository.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_details_page.dart';
import 'package:flutter_api_workshop/features/books/presentation/book_list_item.dart';
import 'package:flutter_api_workshop/features/books/presentation/fave_books_page.dart';

class BooksPage extends StatefulWidget {
  final BooksRepository booksRepository;

  const BooksPage({
    super.key,
    required this.booksRepository,
  });

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final _controller = TextEditingController();
  Future<List<Book>>? _booksFuture;
  var _searchQuery = '';

  @override
  void initState() {
    super.initState();

    _booksFuture = widget.booksRepository.getBooks(query: _searchQuery);

    _controller.addListener(() async {
      // TODO: This should be a debouncer
      final query = _controller.text.length >= 5 ? _controller.text : '';
      if (query == _searchQuery) {
        return;
      }
      _searchQuery = query;
      setState(() {
        _booksFuture = widget.booksRepository.getBooks(query: _searchQuery);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverSearchAppBar(
                controller: _controller,
              ),
              pinned: true,
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Books Search',
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
                if (snapshot.hasError) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'Something went wrong, try again later',
                        style: TextStyle(
                          fontFamily: AppTheme.accentFontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FaveBooksPage(
                booksRepository: widget.booksRepository,
              ),
            ),
          );
        },
        child: const Icon(Icons.favorite_sharp),
      ),
    );
  }

  void _openBookDetails(Book book) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(
          booksRepository: widget.booksRepository,
          bookId: book.id,
          faveId: null,
        ),
      ),
    );
  }
}
