import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = '8103ac07155004086afbb157145f5cb7';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitide;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    // 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
