class Weather {

  static const String WEATHER_ID = 'id';
  static const String MAIN = 'main';
  static const String DESCRIPTION = 'description';
  static const String ICON = 'icon';

  int weatherId;
  String main;
  String description;
  String icon;

  Weather(this.weatherId, this.main, this.description, this.icon);

  factory Weather.fromJason(Map<String, dynamic> parsedJson) {
    return Weather(parsedJson[WEATHER_ID], parsedJson[MAIN], parsedJson[DESCRIPTION], parsedJson[ICON]);
  }
}