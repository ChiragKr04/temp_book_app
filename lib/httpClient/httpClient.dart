import "dart:developer";
import "package:http/http.dart" as http;

class HttpClient {
  final String _apiKey = "AIzaSyADTdGKnlA_nwoAmnQdTFfkmNmqsfz0SIU";

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
