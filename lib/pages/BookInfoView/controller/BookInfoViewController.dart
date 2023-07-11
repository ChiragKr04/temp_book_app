import 'package:book_app/models/BookModel.dart';
import 'package:book_app/repository/BookRepository.dart';
import 'package:get/get.dart';

class BookInfoViewController {
  /// Creating instance of BookRepository which will be used to make api calls
  final BookRepository bookRepository = BookRepository();

  /// Stores the data of a single book which is current view
  Rxn<BookItem> bookData = Rxn<BookItem>();
  RxBool isLoading = false.obs;

  /// Functions gets called when the view is initialized
  void init({
    required bookId,
  }) async {
    isLoading.value = true;

    /// calling api with query to get single books data on based of [bookId]
    bookData.value = await bookRepository.getBookData(bookId: bookId);
    isLoading.value = false;
  }
}
