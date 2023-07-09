import 'package:book_app/httpClient/httpClient.dart';
import 'package:book_app/models/BookModel.dart';
import 'package:http/http.dart' as http;

class BookRepository {
  final HttpClient httpClient = HttpClient();

  Future<List<BookItem>> getBooks({
    required String query,
    required int index,
  }) async {
    final http.Response response = await httpClient.get(
      url:
          'https://www.googleapis.com/books/v1/volumes?q=$query&startIndex=$index',
    );
    return bookModelFromJson(response.body).items;
  }

  Future<BookItem> getBookData({
    required String bookId,
  }) async {
    final http.Response response = await httpClient.get(
      url:
          'https://www.googleapis.com/books/v1/volumes/$bookId',
    );
    return bookItemFromJson(response.body);
  }
}
