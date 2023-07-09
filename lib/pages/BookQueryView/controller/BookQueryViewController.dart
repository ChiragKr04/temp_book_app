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

  void init({
    required String query,
  }) async {
    this.query = query;
    isLoading.value = true;

    /// calling api with query
    await _fetchBooks();
    _listenOnScroll();
    isLoading.value = false;
  }

  void _listenOnScroll() {
    scrollController.onBottomReach(() {
      _fetchBooks();
    });
  }

  Future<void> _fetchBooks() async {
    if (_isSearching.value || _hasReachedEnd.value) return;
    _isSearching.value = true;
    var books = await repository.getBooks(
      query: query,
      index: _index,
    );
    _index += 10;
    this.books.addAll(books);
    if (books.isEmpty) _hasReachedEnd.value = true;
    _isSearching.value = false;
  }

  void dispose() {
    scrollController.dispose();
  }
}
