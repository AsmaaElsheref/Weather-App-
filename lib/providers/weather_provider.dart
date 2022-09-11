import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier

{
  WeatherModel? _WeatherData;
  String? CityName;
  set WeatherData(WeatherModel? model){
    _WeatherData=model;
    notifyListeners();
  }
  WeatherModel? get WeatherData => _WeatherData;
}