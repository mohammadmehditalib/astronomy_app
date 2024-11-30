import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client;

  ApiService(this.client);

  Future<Map<String, dynamic>> fetchAstronomyPicture() async {
    final response = await client
        .get(Uri.parse('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load picture');
    }
  }
}
