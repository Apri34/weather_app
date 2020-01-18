class Main {

  static const String TEMP = 'temp';
  static const String FEELS_LIKE = 'feels_like';
  static const String TEMP_MIN = 'temp_min';
  static const String TEMP_MAX = 'temp_max';
  static const String PRESSURE = 'pressure';
  static const String HUMIDITY = 'humidity';

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  Main(this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity);

  factory Main.fromJson(Map<String, dynamic> parsedJson) {
    return Main(parsedJson[TEMP], parsedJson[FEELS_LIKE], parsedJson[TEMP_MIN], parsedJson[TEMP_MAX], parsedJson[PRESSURE], parsedJson[HUMIDITY]);
  }
}