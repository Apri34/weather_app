class Clouds {

  static const String ALL = 'all';

  int all;

  Clouds(this.all);

  factory Clouds.fromJson(Map<String, dynamic> parsedJson) {
    return Clouds(parsedJson[ALL]);
  }
}