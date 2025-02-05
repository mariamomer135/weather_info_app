import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final TextEditingController _cityController = TextEditingController();
  String cityName = "";
  String temperature = "";
  String weatherCondition = "";

  void fetchWeather() {
    setState(() {
      cityName = _cityController.text;
      temperature = "${Random().nextInt(16) + 15}°C"; // 15°C - 30°C
      weatherCondition = ["Sunny", "Cloudy", "Rainy"][Random().nextInt(3)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Weather Info App')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Enter City Name',
           
