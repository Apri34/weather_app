import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_result.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/loading.dart';
import 'package:weather_app/pages/details.dart';
import 'package:weather_app/pages/full_details.dart';

class RouteGenerator {

  static const String ROUTE_INIT = '/';
  static const String ROUTE_LOADING = '/loading';
  static const String ROUTE_DETAILS = '/details';
  static const String ROUTE_FULL_DETAILS = '/full_details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case ROUTE_INIT:
        return MaterialPageRoute(builder: (_) => Home());
        break;
      case ROUTE_LOADING:
        if(args is String) {
          return MaterialPageRoute(builder: (_) => Loading(args));
        } else {
          return _errorRoute();
        }
        break;
      case ROUTE_DETAILS:
        if(args is WeatherResult) {
          return MaterialPageRoute(builder: (_) => Details(args));
        } else {
          return _errorRoute();
        }
        break;
      case ROUTE_FULL_DETAILS:
        if(args is WeatherResult) {
          return MaterialPageRoute(builder: (_) => FullDetails(args));
        } else {
          return _errorRoute();
        }
        break;
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
      );
    });
  }
}