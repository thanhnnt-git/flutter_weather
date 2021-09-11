import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = '88c00a02c69807df8bbf29e314476b6a';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&units=metric&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int conditionCode) {
    if (conditionCode < 300) {
      return 'thunderstorm';
    } else if (conditionCode < 400) {
      return 'drizzle';
    } else if (conditionCode < 600) {
      return 'rain';
    } else if (conditionCode < 700) {
      return 'snowy';
    } else if (conditionCode == 800) {
      return 'clear';
    } else {
      return 'cloudy';
    }
  }
}
