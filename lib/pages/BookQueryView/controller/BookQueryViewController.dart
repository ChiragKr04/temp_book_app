import 'package:book_app/helpers/helpers.dart';
import 'package:book_app/models/BookModel.dart';
import 'package:book_app/repository/BookRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookQueryViewController {
  late String query;
  RxBool isLoading = false.obs;
  int _index = 0;
  final ScrollController scrollController = ScrollController();
  final BookRepository repository = BookRepository();
  RxList<BookItem> books = <BookItem>[].obs;
  final RxBool _isSearching = false.obs;
  bool get isSearching => _isSearching.value;
  final RxBool _hasReachedEnd = false.obs;
  bool get hasReachedEnd => _hasReachedEnd.value;

  /// Functions gets called when the view is initialized
  void init({
    required String query,
  }) async {
    /// setting query to local variable
    this.query = query;
    isLoading.value = true;

    /// calling api with query to get books data on based of [query]
    await _fetchBooks();

    _listenOnScroll();
    isLoading.value = false;
  }

  /// Function to listen on scroll
  void _listenOnScroll() {
    /// Function to fetch more books when user reaches at the bottom of the list
    scrollController.onBottomReach(() {
      _fetchBooks();
    });
  }

  /// Function to fetch books from api on based of [query]
  Future<void> _fetchBooks() async {
    /// checking if already fetching books or reached end of the list
    if (_isSearching.value || _hasReachedEnd.value) return;
    _isSearching.value = true;
    var books = await repository.getBooks(
      query: query,
      index: _index,
    );

    /// increasing index by 10 to get next 10 books
    _index += 10;

    /// adding books to the previous list
    this.books.addAll(books);

    /// checking if books list is empty means no more books to fetch
    if (books.isEmpty) _hasReachedEnd.value = true;
    _isSearching.value = false;
  }

  /// Function to dispose scrollController when view is destroyed to avoid memory leaks
  void dispose() {
    scrollController.dispose();
  }
}
