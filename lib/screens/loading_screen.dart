import 'package:flutter/material.dart';
import '../services/services.dart';
import 'screens.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getLocationWeather();
  // }

  void getLocationWeather() async {
    var locationWeather = await WeatherCall().getWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationWeatherScreen(locationWeather);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () async {
              var locationWeather = await WeatherCall().getWeather();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LocationWeatherScreen(locationWeather);
              }));
            },
            child: Text('click me'),
          ),
        ),
        // child: Center(
        //   child: CircularProgressIndicator(),
        // ),
      ),
    );
  }
}
