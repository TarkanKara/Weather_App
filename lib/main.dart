// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:weather_app_ui/screens/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final int indexx;
    return ResponsiveSizer(builder: (p0, p1, p2) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "WeatherApp",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomePage(),
      );
    });
  }
}
