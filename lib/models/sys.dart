class Sys {

  static const String TYPE = 'type';
  static const String SYS_ID = 'id';
  static const String COUNTRY_CODE = 'country';
  static const String SUNRISE = 'sunrise';
  static const String SUNSET = 'sunset';

  int type;
  int sysId;
  String countryCode;
  int sunrise;
  int sunset;

  Sys(this.type, this.sysId, this.countryCode, this.sunrise, this.sunset);

  factory Sys.fromJson(Map<String, dynamic> parsedJson) {
    return Sys(parsedJson[TYPE], parsedJson[SYS_ID], parsedJson[COUNTRY_CODE], parsedJson[SUNRISE], parsedJson[SUNSET]);
  }
}