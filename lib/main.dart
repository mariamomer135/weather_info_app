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
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {}, // Placeholder for function
                child: Text('Fetch Weather'),
              ),
              SizedBox(height: 20),
              Text("City: ", style: TextStyle(fontSize: 20)),
              Text("Temperature: ", style: TextStyle(fontSize: 20)),
              Text("Condition: ", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
