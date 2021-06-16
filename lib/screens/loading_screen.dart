import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitide);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'));
    if (response.statusCode == 200) {
      String data = response.body;
      // var longitude = jsonDecode(data)['coord']['lon'];
      // print(longitude);

      var decodedData = jsonDecode(data);

      double temp = jsonDecode(data)['main']['temp'];
      //or
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];
      print(temp);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }

    // print(response);
    // print(response.body);
    // print(response.statusCode);
  }

  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(),
    );
  }
}
