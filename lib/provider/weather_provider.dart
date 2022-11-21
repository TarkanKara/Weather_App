import 'package:flutter/widgets.dart';
import 'package:weather_app_ui/models/current_weather_response.dart';
import 'package:weather_app_ui/models/weather_forecast.dart';
import 'package:weather_app_ui/services/api_services.dart';

class WeatherProvider with ChangeNotifier {
  CurrentWeatherResponse response = CurrentWeatherResponse();
  bool isLoading = false;
  //context kullanıldı
  getWeatherData(BuildContext context) async {
    isLoading = true;
    //context kullanıldı
    response = (await getCurrentData(context))!;
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
