import 'package:get/get.dart';
import 'package:widget_launcher/utils/weather_plugin.dart';

class WeatherController extends GetxController {
  String location = '';
  String icon = (DateTime.now().hour >= 19 || DateTime.now().hour <= 04) ? '01n' : '01d';
  String temperature = '';
  String humidity = '';
  String wind = '';
  String description = '';
  String groundLevel = '';
  String seaLevel = '';

  Future<void> fetchWeather() async {
    try {
      final position = await WeatherPlugin.getCurrentLocation();
      final weatherData = await WeatherPlugin.fetchWeather(
        position.latitude,
        position.longitude,
      );
      print("weatherData $weatherData");

      location = weatherData['name'];
      icon = weatherData['weather'][0]['icon'];
      description = weatherData['weather'][0]['description'];
      temperature = '${weatherData['main']['temp']}°C';
      humidity = '${weatherData['main']['humidity']}%';
      groundLevel = '${weatherData['main']['grnd_level']} hPa';
      seaLevel = '${weatherData['main']['sea_level']} hPa';
      wind = '${(weatherData['wind']['speed'] * 3.6).toString().split('.')[0]}km/h';
    } catch (e) {
      print("weatherData $e");
      location = '';
      temperature = '';
      humidity = '';
      wind = '';
      description = '';
      groundLevel = '';
      seaLevel = '';
    }

    update();
  }
}
