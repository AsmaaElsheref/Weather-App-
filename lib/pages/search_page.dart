import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {

   SearchPage({this.UpdateUi});
   VoidCallback?UpdateUi;
  String? CityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City')
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onSubmitted: (data) async {
                CityName=data;
                WeatherService service =WeatherService();
               WeatherModel? model = await service.getWeather(CityName: CityName!);

               Provider.of<WeatherProvider>(context,listen:false).WeatherData=model;
                Provider.of<WeatherProvider>(context,listen:false).CityName=CityName;


                Navigator.pop(context);
              },
               decoration: InputDecoration(
                 contentPadding: EdgeInsets.symmetric(vertical: 32 , horizontal: 16),
                 hintText: 'Enter a city',
                 border: OutlineInputBorder(),
                 label: Text('search'),
                 suffixIcon: Icon(Icons.search)
               ),
            ),
          )),
    );
  }
}
