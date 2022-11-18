// ignore_for_file: depend_on_referenced_packages, avoid_print, unused_local_variable

import 'dart:developer';

import 'package:weather_app_ui/models/weather_forecast.dart';
import 'package:weather_app_ui/services/logging.dart';

import '../models/current_weather_response.dart';
import 'package:dio/dio.dart';

/* 
//http package replaced with dioClient
Future<CurrentWeatherResponse?> getCurrentData() async {
  CurrentWeatherResponse weatherResponse;
  try {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=41.024556&lon=29.019009&units=metric&appid=632352c89fc0115888423c5a5336dca9"));
    print(response.body);
    return weatherResponse =
        CurrentWeatherResponse.fromJson(jsonDecode(response.body));
  } catch (e) {
    log(e.toString());
  }
  return null;
} */

//http package replaced with dio package
/* 
Future<WeatherForecast?> getCurrentDataForecast(context) async {
  WeatherForecast forecast;
  try {
    final responsee = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=41.024556&lon=29.019009&units=metric&appid=632352c89fc0115888423c5a5336dca9"));
    forecast = WeatherForecast.fromJson(jsonDecode(responsee.body));
    print(responsee.body);
    return forecast;
  } catch (e) {
    log(
      e.toString(),
    );
  }
  return null;
}
*/

//Dio Packages
Future<WeatherForecast?> getCurrentDataForecast(context) async {
  WeatherForecast forecast;
  Response responsee;

  try {
    final responsee = await Dio().get(
        "https://api.openweathermap.org/data/2.5/forecast",
        queryParameters: {
          "lat": 41.024556,
          "lon": 29.019009,
          "units": "metric",
          "appid": "632352c89fc0115888423c5a5336dca9",
        });
    forecast = WeatherForecast.fromJson(responsee.data);
    print(responsee.data);
    return forecast;
  } catch (e) {
    log(
      e.toString(),
    );
  }
  return null;
}

/* ---------------------------------------------------------------------------- */
const String mybaseUrl = "https://api.openweathermap.org/data/2.5/weather?";

//DioClient
final Dio _dio = Dio(
  BaseOptions(
    baseUrl: mybaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ),
)..interceptors.add(Loggining());

Future<CurrentWeatherResponse?> getCurrentData() async {
  CurrentWeatherResponse weatherResponse;
  try {
    final response = await _dio.get(mybaseUrl, queryParameters: {
      "lat": 41.024556,
      "lon": 29.019009,
      "units": "metric",
      "appid": "632352c89fc0115888423c5a5336dca9",
    });
    print(response.data);
    return weatherResponse = CurrentWeatherResponse.fromJson(response.data);
  } catch (e) {
    log(e.toString());
  }
  return null;
}
/* ---------------------------------------------------------------------------- */