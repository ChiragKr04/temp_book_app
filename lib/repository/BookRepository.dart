import 'package:book_app/httpClient/httpClient.dart';
import 'package:book_app/models/BookModel.dart';
import 'package:http/http.dart' as http;

class BookRepository {
  /// Creating instance of HttpClient which will be used to make api calls
  final HttpClient _httpClient = HttpClient();

  /// Function to get books from google api
  /// [query] is the search query
  /// [index] is the index of the book from where to start fetching books
  Future<List<BookItem>> getBooks({
    required String query,
    required int index,
  }) async {
    final http.Response response = await _httpClient.get(
      url:
          'https://www.googleapis.com/books/v1/volumes?q=$query&startIndex=$index',
    );
    return bookModelFromJson(response.body).items;
  }

  /// Function to get single book data from google api
  /// [bookId] is the id of the book
  Future<BookItem> getBookData({
    required String bookId,
  }) async {
    final http.Response response = await _httpClient.get(
      url:
          'https://www.googleapis.com/books/v1/volumes/$bookId',
    );
    return bookItemFromJson(response.body);
  }
}
