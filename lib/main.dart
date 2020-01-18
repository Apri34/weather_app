import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/route_generator.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  initialRoute: RouteGenerator.ROUTE_INIT,
  onGenerateRoute: RouteGenerator.generateRoute,
));

