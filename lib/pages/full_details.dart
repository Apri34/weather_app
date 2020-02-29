import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_result.dart';

class FullDetails extends StatelessWidget {

  final WeatherResult weatherResult;
  FullDetails(this.weatherResult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weatherResult.cityName),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(weatherResult.weather[0] != null ? 'Weather: ${weatherResult.weather[0].description}' : "",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            Text(weatherResult.main.temp != null ? 'Temperature: ${getCelsius(weatherResult.main.temp)}°C' : "",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            Text(weatherResult.main.pressure != null ? 'Pressure: ${weatherResult.main.pressure} pa' : "",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            Text(weatherResult.main.humidity != null ? 'Humidity: ${weatherResult.main.humidity}' : "",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            Text(weatherResult.main.seaLevel != null ? 'Sea level: ${weatherResult.main.seaLevel}' : "",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            Text(weatherResult.wind.deg != null ? 'Windspeed: ${weatherResult.wind.speed} km/h (${weatherResult.wind.deg}°)'
              : 'Windspeed: ${weatherResult.wind.speed} km/h',
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }

  String getCelsius(double kelvin) {
    return (kelvin - 273.15).toStringAsFixed(2);
  }
}
