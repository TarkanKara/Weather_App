// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:convert';
import 'dart:developer';

import '../models/current_weather_response.dart';
import 'package:http/http.dart' as http;

Future<CurrentWeatherResponse?> getCurrentData(context) async {
  CurrentWeatherResponse weatherResponse;
  try {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=41.024556&lon=29.019009&units=metric&appid=632352c89fc0115888423c5a5336dca9"));
    weatherResponse =
        CurrentWeatherResponse.fromJson(jsonDecode(response.body));
    print(response.body);
    return weatherResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}
