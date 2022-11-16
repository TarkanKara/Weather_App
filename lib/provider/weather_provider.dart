import 'package:flutter/widgets.dart';
import 'package:weather_app_ui/models/current_weather_response.dart';
import 'package:weather_app_ui/models/weather_forecast.dart';
import 'package:weather_app_ui/services/api_services.dart';

class WeatherProvider with ChangeNotifier {
  CurrentWeatherResponse response = CurrentWeatherResponse();
  bool isLoading = false;

  getWeatherData() async {
    isLoading = true;
    response = (await getCurrentData())!;
    isLoading = false;
    notifyListeners();
  }
}

class ForecastProvider with ChangeNotifier {
  WeatherForecast responsee = WeatherForecast();
  bool isLoading = false;

  getForecastData(context) async {
    isLoading = true;
    responsee = (await getCurrentDataForecast(context))!;
    isLoading = false;
    notifyListeners();
  }
}
