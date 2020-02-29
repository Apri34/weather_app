import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_result.dart';
import 'package:weather_app/route_generator.dart';

class Details extends StatelessWidget {

  static const String ICON_BASE_URL = 'http://openweathermap.org/img/wn/';
  static const String ICON_ENDPOINT = '@2x.png';

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
              child: Image.network(
                getIconUrl(weatherResult.weather[0].icon),
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null ?
                      loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
            ),
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
          Navigator.of(context).pushNamed(RouteGenerator.ROUTE_FULL_DETAILS, arguments: weatherResult);
        },
        child: Text('Details'),
      ),
    );
  }

  String getCelsius(double kelvin) {
    return (kelvin - 273.15).toStringAsFixed(2);
  }

  String getIconUrl(String iconCode) {
    return ICON_BASE_URL + iconCode + ICON_ENDPOINT;
  }
}
