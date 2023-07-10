import 'package:book_app/helpers/helpers.dart';
import 'package:book_app/models/BookModel.dart';
import 'package:book_app/repository/BookRepository.dart';
import 'package:get/get.dart';

class ShopViewController {
  BookRepository bookRepository = BookRepository();

  Rxn<List<BookItem>> topSelling = Rxn<List<BookItem>>();
  Rxn<List<BookItem>> discountBooks = Rxn<List<BookItem>>();
  Rxn<List<BookItem>> saleBooks = Rxn<List<BookItem>>();

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

class BookCategoryData {
  final String title;
  final String image;
  final BookCategory category;

  BookCategoryData({
    required this.title,
    required this.image,
    required this.category,
  });
}
