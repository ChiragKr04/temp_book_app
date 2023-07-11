import 'package:book_app/models/BookModel.dart';
import 'package:book_app/repository/BookRepository.dart';
import 'package:get/get.dart';

class ShopViewController {
  BookRepository bookRepository = BookRepository();

  /// Stores different list of books for different categories
  Rxn<List<BookItem>> topSelling = Rxn<List<BookItem>>();
  Rxn<List<BookItem>> discountBooks = Rxn<List<BookItem>>();
  Rxn<List<BookItem>> saleBooks = Rxn<List<BookItem>>();

  /// Fetching all books based on category and storing them in respective variables
  void fetchAllBooks() async {
    topSelling.value = await bookRepository.getBooks(
      index: 1,
      query: "Top Selling",
    );
    discountBooks.value = await bookRepository.getBooks(
      index: 1,
      query: "Discount Books",
    );
    saleBooks.value = await bookRepository.getBooks(
      index: 1,
      query: "Sale",
    );
  }
}
