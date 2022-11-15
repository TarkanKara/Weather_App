import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:weather_app_ui/models/current_weather_response.dart';
import 'package:weather_app_ui/models/weather_forecast.dart';
import 'package:weather_app_ui/services/api_services.dart';

class WeatherProvider with ChangeNotifier {
  CurrentWeatherResponse response = CurrentWeatherResponse();
  bool isLoading = false;

  getWeatherData(context) async {
    isLoading = true;
    response = (await getCurrentData(context))!;
    isLoading = false;
    notifyListeners();
  }
}

class ForecastProvider with ChangeNotifier {
  WeatherForecast responsee = WeatherForecast();

  getForecastData(context) async {
    responsee = (await getCurrentDataForecast(context))!;
    notifyListeners();
  }
}
