class Coord {

  static const String LON = 'lon';
  static const String LAT = 'lat';

  double lon;
  double lat;

  Coord(this.lon, this.lat);

  factory Coord.fromJson(Map<String, dynamic> parsedJson) {
    return Coord(parsedJson[LON], parsedJson[LAT]);
  }
}