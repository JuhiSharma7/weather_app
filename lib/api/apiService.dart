// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey =
      '1061ad212050403750f275faa441e8da'; // Replace with your actual API key
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http
        .get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data: ${response.reasonPhrase}');
    }
  }
}
