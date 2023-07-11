import "package:http/http.dart" as http;

class HttpClient {
  /// Google api key
  final String _apiKey = "AIzaSyADTdGKnlA_nwoAmnQdTFfkmNmqsfz0SIU";

  /// Function to make get request
  /// [url] is the url to make get request
  /// [headers] is the headers to be passed in the request
  Future<http.Response> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": _apiKey,
        ...?headers,
      },
    );
    return response;
  }
}
