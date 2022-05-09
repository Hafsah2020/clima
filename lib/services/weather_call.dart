import 'services.dart';

String apiKey = 'b226d60fe5dcea99db8776e413a63596';
final lat = Location().latitude;
final lon = Location().longitude;

class WeatherCall {
  Future<dynamic> getWeather() async {
    final data = NetworkRetriever(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
    var weatherData = await data.getData();
    print(weatherData);
    return weatherData;
  }
}
