import 'package:book_app/helpers/helpers.dart';
import 'package:book_app/models/BookModel.dart';
import 'package:book_app/repository/BookRepository.dart';
import 'package:get/get.dart';

class HomeViewController {
  List<BookCategoryData> getBookCategoryData() {
    return [
      BookCategoryData(
        title: 'Top Selling',
        image: 'assets/images/medal.png',
        category: BookCategory.TopSelling,
      ),
      BookCategoryData(
        title: 'New Releases',
        image: 'assets/images/new_book.png',
        category: BookCategory.NewReleases,
      ),
      BookCategoryData(
        title: 'Comedy',
        image: 'assets/images/laughing.png',
        category: BookCategory.Comedy,
      ),
      BookCategoryData(
        title: 'Comics',
        image: 'assets/images/comic.png',
        category: BookCategory.Comics,
      ),
    ];
  }

  BookRepository bookRepository = BookRepository();

  Rxn<List<BookItem>> adventureBooks = Rxn<List<BookItem>>();
  Rxn<List<BookItem>> scifiBooks = Rxn<List<BookItem>>();
  Rxn<List<BookItem>> nonfictionBooks = Rxn<List<BookItem>>();
  Rxn<List<BookItem>> inspiringBooks = Rxn<List<BookItem>>();

  void fetchAllBooks() async {
    adventureBooks.value = await bookRepository.getBooks(
      index: 1,
      query: "adventure",
    );
    scifiBooks.value = await bookRepository.getBooks(
      index: 1,
      query: "sci fi",
    );
    nonfictionBooks.value = await bookRepository.getBooks(
      index: 1,
      query: "non fiction",
    );
    inspiringBooks.value = await bookRepository.getBooks(
      index: 1,
      query: "inspiring",
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
