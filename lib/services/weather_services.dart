import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService{
  Future<WeatherModel?> getWeather({required String CityName}) async
  {
    WeatherModel? model;
    try{
     String s='http://api.weatherapi.com/v1/forecast.json?key=3d77546974f649d1833131455222908&q=London&days=1&aqi=no&alerts=no';
     Uri url=Uri.parse(s.replaceAll('London', CityName));
     http.Response response = await http.get(url);
     Map<String,dynamic> data =jsonDecode(response.body);

    model = WeatherModel.fromJson(data);

   }
   catch(e){
     print(e);

   }
    return model;
  }
  }

