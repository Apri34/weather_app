import 'package:weather_app/models/clouds.dart';
import 'package:weather_app/models/coord.dart';
import 'package:weather_app/models/main.dart';
import 'package:weather_app/models/sys.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/wind.dart';

class WeatherResult {

  static const String COORD = 'coord';
  static const String WEATHER = 'weather';
  static const String BASE = 'base';
  static const String MAIN = 'main';
  static const String VISIBILITY = 'visibility';
  static const String WIND = 'wind';
  static const String CLOUDS = 'clouds';
  static const String DT = 'dt';
  static const String SYS = 'sys';
  static const String TIMEZONE = 'timezone';
  static const String WEATHER_RESULT_ID = 'id';
  static const String CITY_NAME = 'name';
  static const String COD = 'cod';

  static const String ERROR_MESSAGE = 'message';

  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int weatherResultId;
  String cityName;
  int cod;

  WeatherResult(this.coord, this.weather, this.base, this.main, this.visibility, this.wind, this.clouds, this.dt, this.sys, this.timezone, this.weatherResultId, this.cityName, this.cod);

  factory WeatherResult.fromJson(Map<String, dynamic> parsedJson) {

    List list = parsedJson[WEATHER];
    List<Weather> weather = List();
    if(list == null)
      weather = null;
    else {
      for (int i = 0; i < list.length; i++) {
        weather.add(
            Weather.fromJason(list[i])
        );
      }
    }

    return WeatherResult(
      Coord.fromJson(parsedJson[COORD]),
      weather,
      parsedJson[BASE],
      Main.fromJson(parsedJson[MAIN]),
      parsedJson[VISIBILITY],
      Wind.fromJson(parsedJson[WIND]),
      Clouds.fromJson(parsedJson[CLOUDS]),
      parsedJson[DT],
      Sys.fromJson(parsedJson[SYS]),
      parsedJson[TIMEZONE],
      parsedJson[WEATHER_RESULT_ID],
      parsedJson[CITY_NAME],
      parsedJson[COD]
    );
  }
}