import 'package:book_app/models/BookModel.dart';
import 'package:book_app/repository/BookRepository.dart';
import 'package:get/get.dart';

class BookInfoViewController {
  final BookRepository bookRepository = BookRepository();

  Rxn<BookItem> bookData = Rxn<BookItem>();
  RxBool isLoading = false.obs;

  void init({
    required bookId,
  }) async {
    isLoading.value = true;

    /// calling api with query
    bookData.value = await bookRepository.getBookData(bookId: bookId);
    isLoading.value = false;
  }
}
