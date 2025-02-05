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
  List<Map<String, String>> weeklyForecast = [];

  void fetchWeather() {
    setState(() {
      cityName = _cityController.text;
      temperature = "${Random().nextInt(16) + 15}°C"; // 15°C - 30°C
      weatherCondition = ["Sunny", "Cloudy", "Rainy"][Random().nextInt(3)];
      weeklyForecast.clear();
    });
  }

  void fetch7DayForecast() {
    setState(() {
      weeklyForecast = List.generate(7, (index) {
        return {
          "day": "Day ${index + 1}",
          "temperature": "${Random().nextInt(16) + 15}°C",
          "condition": ["Sunny", "Cloudy", "Rainy"][Random().nextInt(3)]
        };
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Weather Info App')),
        body: SingleChildScrollView( // FIX: Allows scrolling if content overflows
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'Enter City Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: fetchWeather,
                      child: Text('Fetch Weather'),
                    ),
                    ElevatedButton(
                      onPressed: fetch7DayForecast,
                      child: Text('7-Day Forecast'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (cityName.isNotEmpty)
                  Column(
                    children: [
                      Text("City: $cityName", style: TextStyle(fontSize: 20)),
                      Text("Temperature: $temperature", style: TextStyle(fontSize: 20)),
                      Text("Condition: $weatherCondition", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                SizedBox(height: 20),
                if (weeklyForecast.isNotEmpty)
                  Column(
                    children: [
                      Text("7-Day Forecast", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ...weeklyForecast.map((day) => Card(
                            child: ListTile(
                              title: Text(day["day"]!),
                              subtitle: Text("${day["temperature"]} - ${day["condition"]}"),
                            ),
                          )),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
