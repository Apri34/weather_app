import 'package:flutter/material.dart';
import 'package:weather_app/route_generator.dart';

class Home extends StatelessWidget {

  static const String APP_NAME = "Weather App";

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Type in a location',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              TextField(
                controller: controller,
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String city = controller.text;
          Navigator.of(context).pushNamed(RouteGenerator.ROUTE_LOADING, arguments: city);
          controller.clear();
        },
        child: Text('Go'),
      ),
    );
  }
}