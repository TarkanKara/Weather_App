// ignore_for_file: depend_on_referenced_packages, avoid_print, unused_local_variable, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app_ui/models/weather_forecast.dart';
import 'package:weather_app_ui/services/logging.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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

/*---------------------------START Dio Client--------------------------------- */
final Dio _dio = Dio(
  BaseOptions(
    baseUrl: "https://api.openweathermap.org/data/2.5/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ),
)..interceptors.add(Loggining());

/*----------------------------END Dio Client---------------------------------- */

//WeatherForecast
Future<WeatherForecast?> getCurrentDataForecast(context) async {
  WeatherForecast forecast;
  Response responsee;

  try {
    final responsee = await _dio.get("forecast", queryParameters: {
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

//CurrentWeatherResponse
Future<CurrentWeatherResponse?> getCurrentData(BuildContext context) async {
  CurrentWeatherResponse weatherResponse;
  try {
    final response = await _dio.get("weather?", queryParameters: {
      "lat": 41.024556,
      "lon": 29.019009,
      "units": "metric",
      "appid": "632352c89fc0115888423c5a5336dca9",
    });
    print(response.data);

    switch (response.statusCode) {
      case 200:
        snackBarr("200", "İstekBaşarılı", context);
        break;
      case 400:
        snackBarr("400", "istek Geçersiz", context);
        break;
      case 401:
        snackBarr("401", "Yetkisiz", context);
        break;
      case 403:
        snackBarr("403", "Yasaklı", context);
        break;
      case 404:
        snackBarr("404", "Sayfa Bulunamadı", context);
        break;
      case 500:
        snackBarr("500", "Sunucu Hatası", context);
        break;
      case 502:
        snackBarr("502", "Geçersiz Ağ Geçidi", context);
        break;
      default:
        snackBarr("Oops", "Birşeyler Yanlış Gitti", context);
    }
    return weatherResponse = CurrentWeatherResponse.fromJson(response.data);
  } catch (e) {
    log(e.toString());
  }
  return null;
}

//SnackBarMethod
snackBarr(String title, message, BuildContext context) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      color: Colors.amber,
      title: title,
      message: message,
      contentType: ContentType.failure,
    ),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}


/* ---------------------------------------------------------------------------- */