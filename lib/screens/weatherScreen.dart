// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/api/weatherProvider.dart';

class WeatherScreen extends StatelessWidget {
  final String city;

  const WeatherScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Weather in $city',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Provider.of<WeatherProvider>(context, listen: false)
                  .fetchWeather(city);
            },
          ),
        ],
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.weather == null) {
            return Center(child: Text('Error: ${provider.error}'));
          } else {
            final weather = provider.weather;
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('City: ${weather?['name']}',
                      style: const TextStyle(fontSize: 24)),
                  Text('Temperature: ${weather?['main']['temp']} °C',
                      style: const TextStyle(fontSize: 24)),
                  Text('Condition: ${weather!['weather'][0]['description']}',
                      style: const TextStyle(fontSize: 24)),
                  Image.network(
                      'https://openweathermap.org/img/wn/${weather['weather'][0]['icon']}@2x.png'),
                  Text('Humidity: ${weather['main']['humidity']}%',
                      style: const TextStyle(fontSize: 24)),
                  Text('Wind Speed: ${weather['wind']['speed']} m/s',
                      style: const TextStyle(fontSize: 24)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
