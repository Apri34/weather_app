import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:weather_app/models/weather_result.dart';
import 'package:weather_app/route_generator.dart';

class Loading extends StatefulWidget {

  final String city;

  Loading(this.city);

  @override
  _LoadingState createState() => _LoadingState(city);
}

class _LoadingState extends State<Loading> {

  static const String API_KEY = '&appid=77ee63e9f41efc215b27ffb9aa56b02e';
  static const String BASE_URL = 'http://api.openweathermap.org';
  static const String ENDPOINT = '/data/2.5/weather?q=';

  static const int COD_SUCCESS = 200;
  static const int COD_CITY_NOT_EXISTS = 404;

  final String city;
  _LoadingState(this.city);

  String shownText;
  bool showProgressIndicator = false;

  void loadData(BuildContext context, String city) async {
    String url = getUrl(city);
    Response response = await get(url);
    Map jsonResponse = jsonDecode(response.body);

    int cod;
    if(jsonResponse[WeatherResult.COD] is int) {
      cod = jsonResponse[WeatherResult.COD];
    } else {
      String _cod = jsonResponse[WeatherResult.COD];
      cod = int.parse(_cod);
    }

    if(cod == COD_SUCCESS) {
      WeatherResult weatherResult = WeatherResult.fromJson(jsonResponse);
      Navigator.of(context).popAndPushNamed(RouteGenerator.ROUTE_DETAILS, arguments: weatherResult);
    }
    else if(cod == COD_CITY_NOT_EXISTS) {
      if(jsonResponse[WeatherResult.ERROR_MESSAGE] == 'city not found') {
        setState(() {
          shownText = 'City $city does not exist.';
          showProgressIndicator = false;
        });
      } else {
        setState(() {
          shownText = 'Something went wrong';
          showProgressIndicator = false;
        });
      }
    }
    else {
      setState(() {
        shownText = 'Something went wrong';
        showProgressIndicator = false;
      });
    }
  }

  String getUrl(String city) {
    return BASE_URL + ENDPOINT + city + API_KEY;
  }

  @override
  void initState() {
    super.initState();
    shownText = 'Loading data for $city';
    showProgressIndicator = true;
    loadData(context, city);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Loading Data',
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(shownText,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            Visibility(
              child: CircularProgressIndicator(),
              visible: showProgressIndicator,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Back'),
      ),
    );
  }
}