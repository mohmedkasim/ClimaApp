import 'networking.dart';
import 'location.dart';

const apiKey = '2c6693f0132e299bc41f2aef4f332e5b&units=metric';
const url = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    location.longitude = location.longitude;
    location.latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(url +
        "?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getCityWeather(cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$url?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = networkHelper.getData();
    return weatherData;
  }
}
