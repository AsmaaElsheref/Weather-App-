
import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String WeatherStateName;
  var image;

  WeatherModel({required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.WeatherStateName,
    required this.image});


  factory WeatherModel.fromJson(dynamic data)
  {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    print(jsonData);

    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        WeatherStateName: jsonData['condition']['text'],
        image: jsonData['condition']['icon']

    );
  }

  @override
  String toString() {
    return super.toString();
  }

  MaterialColor? getThemeColor() {
    if (WeatherStateName == 'Clear' || WeatherStateName == 'Light cloudy'
        || WeatherStateName == 'Partly cloudy'
        || WeatherStateName == 'Sunny') {
      return Colors.orange;
    }
    else if (WeatherStateName == 'Sleet' || WeatherStateName == 'Snow' ||
        WeatherStateName == 'Hail') {
      return Colors.lightBlue;
    }
    else if (WeatherStateName == 'Heavy cloudy') {
      return Colors.blueGrey;
    }
    else if (WeatherStateName == 'Moderate rain' || WeatherStateName=='Light rain' ||
        WeatherStateName=='Heavy rain' ||
        WeatherStateName=='Showers') {
      return Colors.teal;
    }
    else {
      return Colors.deepOrange;
    }
  }
}