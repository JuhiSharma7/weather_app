// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/api/apiService.dart';

class WeatherProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool isLoading = false;
  Map<String, dynamic>? weather;
  String? error;

  void fetchWeather(String city) async {
    isLoading = true;
    notifyListeners();

    try {
      weather = await _apiService.fetchWeather(city);
      error = null;

      // Save the last searched city
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('last_city', city);
    } catch (e) {
      error = e.toString();
      weather = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
