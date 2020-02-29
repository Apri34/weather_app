class Main {

  static const String TEMP = 'temp';
  static const String FEELS_LIKE = 'feels_like';
  static const String TEMP_MIN = 'temp_min';
  static const String TEMP_MAX = 'temp_max';
  static const String PRESSURE = 'pressure';
  static const String HUMIDITY = 'humidity';
  static const String SEA_LEVEL = 'sea_level';

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  double seaLevel;

  Main(this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity, this.seaLevel);

  factory Main.fromJson(Map<String, dynamic> parsedJson) {
    return Main(parsedJson[TEMP], parsedJson[FEELS_LIKE], parsedJson[TEMP_MIN], parsedJson[TEMP_MAX], parsedJson[PRESSURE], parsedJson[HUMIDITY], parsedJson[SEA_LEVEL]);
  }
}