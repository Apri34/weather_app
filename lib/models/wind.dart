class Wind {
  double speed;
  int deg;

  Wind(this.speed, this.deg);

  factory Wind.fromJson(Map<String, dynamic> parsedJson) {
    return Wind(parsedJson['speed'], parsedJson['dep']);
  }
}