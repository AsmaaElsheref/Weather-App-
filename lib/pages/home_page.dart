import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class Home_Page extends StatefulWidget {
 Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {


  void UpdateUi(){
    setState((){

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Weather App ☁'),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return SearchPage(

              UpdateUi:UpdateUi,
            );
          }));

  }, icon: Icon(Icons.search))
          ],
        ),
        body: Provider.of<WeatherProvider>(context).WeatherData ==null? Center(
            child: Text('there is no weather 😔 start \n searching now 🔍 ',
            style: TextStyle( fontSize: 30 , color: Colors.black),
            )) : Container(
          decoration:BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Provider.of<WeatherProvider>(context).WeatherData!.getThemeColor()!,
                Provider.of<WeatherProvider>(context).WeatherData!.getThemeColor()![300]!,
                Provider.of<WeatherProvider>(context).WeatherData!.getThemeColor()![100]!
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ) ,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 2,),
                Text(
                  Provider.of<WeatherProvider>(context).CityName!,
                  style: TextStyle(fontSize:32,fontWeight: FontWeight.bold ),),
                Text(
                    Provider.of<WeatherProvider>(context).WeatherData!.date,
                    style: TextStyle(fontSize: 20)),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image:NetworkImage('https:'+Provider.of<WeatherProvider>(context).WeatherData!.image)),
                  Text(
                  ('temp :${Provider.of<WeatherProvider>(context).WeatherData!.temp.toInt()}' ),
                      style:TextStyle(fontSize:32 )
                  ),
                  Column(
                    children: [
                      Text('minTemp:${Provider.of<WeatherProvider>(context).WeatherData!.minTemp.toInt()}'),
                      Text('maxTemp:${Provider.of<WeatherProvider>(context).WeatherData!.maxTemp.toInt()}')
                    ],
                  )
                ],
              ),
              Spacer(),
              Text(
                Provider.of<WeatherProvider>(context).WeatherData!.WeatherStateName,
                style: TextStyle(fontSize:32,fontWeight: FontWeight.bold ),),
                Spacer(flex:4)
      ]
          ),
        ),
      );

  }


}

