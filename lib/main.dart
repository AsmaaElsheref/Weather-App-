import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';


void main() {
  runApp( ChangeNotifierProvider(
      create: (context){
        return WeatherProvider();
      },
      child: Weather_App()));
}
class Weather_App extends StatelessWidget {
  const Weather_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
    primarySwatch: Provider.of<WeatherProvider>(context).WeatherData==null? Colors.cyan :
    Provider.of<WeatherProvider>(context).WeatherData?.getThemeColor()),
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Home_Page(),
      )
    );
  }
}

