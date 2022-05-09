import 'package:flutter/material.dart';
import '../constants.dart';

class LocationWeatherScreen extends StatefulWidget {
  LocationWeatherScreen(this.locationWeather);
  final locationWeather;

  @override
  State<LocationWeatherScreen> createState() => _LocationWeatherScreenState();
}

class _LocationWeatherScreenState extends State<LocationWeatherScreen> {
  var temperature;
  var cityName;
  var windSpeed;
  var humidity;
  var weather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
    print(widget.locationWeather);
    print(temperature);
  }

  void updateUI() {
    if (widget.locationWeather != null) {
      temperature = widget.locationWeather['main']['temp'];
      cityName = widget.locationWeather['name'];
      humidity = widget.locationWeather['main']['humidity'];
      weather = widget.locationWeather['weather'][0]['main'];
      windSpeed = widget.locationWeather['wind']['speed'];
    } else {
      temperature = 'loading';
      cityName = 'loading';
      humidity = 'loading';
      weather = 'loading';
      windSpeed = 'loading';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.black54,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/bg.jpg'), fit: BoxFit.fill)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${cityName}', style: textStyle(32)),
              vertSpace,
              Text('${temperature}', style: textStyle(50)),
              vertSpace,
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 32,
                  child: Expanded(
                    child: Row(
                      children: [
                        Details(
                          detail: 'Wind Speed',
                          value: '${windSpeed}',
                        ),
                        horiSpace,
                        Details(
                          detail: 'Humidity',
                          value: '${humidity}',
                        ),
                        horiSpace,
                        Details(
                          detail: 'Weather',
                          value: '${weather}',
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}

class Details extends StatelessWidget {
  Details({required this.detail, required this.value});

  String detail;
  String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          detail,
          style: textStyle(18),
        ),
        Text(
          value,
          style: textStyle(12),
        )
      ],
    );
  }
}
