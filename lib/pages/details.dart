import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_result.dart';

class Details extends StatelessWidget {

  final WeatherResult weatherResult;
  Details(this.weatherResult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weatherResult.cityName),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(weatherResult.weather[0] != null ? 'Weather: ${weatherResult.weather[0].description}' : "",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('Current Temperature: ${getCelsius(weatherResult.main.temp)}°C',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('Windspeed: ${weatherResult.wind.speed} km/h',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Back'),
      ),
    );
  }

  String getCelsius(double kelvin) {
    return (kelvin - 273.15).toStringAsFixed(2);
  }
}
