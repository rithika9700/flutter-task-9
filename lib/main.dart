import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  var temp;
  var humidity;
  var temperature;

  var windSpeed;
  var description;
  Future getWeather () async{
    http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?q=Chennai&units=imperial&appid=9c8be3df56dd3124b2aec6acbe15e0db");
    var results=jsonDecode(response.body);
    setState(() {
      this.temp=results['main']['temp'];
      this.description=results['weather'][0]['description'];

      this.humidity=results['main']['humidity'];
      this.windSpeed=results['wind']['speed'];
    });

  }
  @override
  void initState() {
    super.initState();
    this.getWeather();
  }




@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text('Weather App', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.lightBlue),),
          backgroundColor: Colors.lime,


        ),
          body: Container(
           child:  ListView(
             children: [
               Text('     Weather Report',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.black),),
               Text('    Currently in Chennai',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.black),),

               SizedBox(
                 height: 30,

               ),
               Image.asset('assets/weather.jpg'),
               SizedBox(
                 height: 30,

               ),

               ListTile(
                 leading: Icon(Icons.lightbulb_outline),
                 title: Text('Temperature'),
                 trailing:Text( temp!= null ? temp.toString()  +"\u00B0'" : "loading"   ),
               ),
               ListTile(
                 leading: Icon(Icons.cloud),
                 title: Text('Weather'),
                 trailing: Text(description!= null ? description.toString() : "loading"),
               ),
               ListTile(
                 leading: Icon(Icons.wb_sunny),
                 title: Text('humidity'),
                 trailing: Text(humidity!= null ? humidity.toString() : "loading"),
               ),
               ListTile(
                 leading: Icon(Icons.filter_drama),
                 title: Text('Wind Speed'),
                 trailing: Text(windSpeed!= null ? windSpeed.toString() : "loading"),
               ),






             ],



           ),







          )

      ),


    );
  }
}








































































