// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:weather_app_ui/core/app_asset.dart';

class WeatherLocation {
  final String city;
  final String temparature;
  final String dateTime;
  final String weatherType;
  final String iconUrl;
  String? kelembaban;
  String? airPressure;
  String? windSpeed;
  String? fog;

  WeatherLocation({
    required this.city,
    required this.temparature,
    required this.dateTime,
    required this.weatherType,
    required this.iconUrl,
    this.kelembaban,
    this.airPressure,
    this.windSpeed,
    this.fog,
  });
}

final locationList = [
  WeatherLocation(
    city: 'Hujan Berawan',
    temparature: '18\u2103',
    dateTime: "Senin, 20 Desember 2021",
    weatherType: 'morning',
    iconUrl: appAssets.rain1,
    kelembaban: "86 %",
    airPressure: "940 hpa",
    windSpeed: "1 km/h",
    fog: "14 %",
  ),
  WeatherLocation(
    city: 'Hujan Selasa',
    temparature: '21\u2103',
    dateTime: "Senin, 20 Desember 2021",
    weatherType: 'morning',
    iconUrl: appAssets.rain1,
    kelembaban: "86 %",
    airPressure: "940 hpa",
    windSpeed: "1 km/h",
    fog: "14 %",
  ),
  WeatherLocation(
    city: 'Hujan Selasa',
    temparature: '23\u2103',
    dateTime: "Senin, 20 Desember 2021",
    weatherType: 'morning',
    iconUrl: appAssets.rain1,
    kelembaban: "86 %",
    airPressure: "940 hpa",
    windSpeed: "1 km/h",
    fog: "14 %",
  ),
  WeatherLocation(
    city: 'Hujan Selasa',
    temparature: '17\u2103',
    dateTime: "Senin, 20 Desember 2021",
    weatherType: 'morning',
    iconUrl: appAssets.rain1,
    kelembaban: "86 %",
    airPressure: "940 hpa",
    windSpeed: "1 km/h",
    fog: "14 %",
  ),
  WeatherLocation(
    city: 'Hujan Selasa',
    temparature: '25\u2103',
    dateTime: "Senin, 20 Desember 2021",
    weatherType: 'morning',
    iconUrl: appAssets.rain1,
    kelembaban: "86 %",
    airPressure: "940 hpa",
    windSpeed: "1 km/h",
    fog: "14 %",
  ),
];
