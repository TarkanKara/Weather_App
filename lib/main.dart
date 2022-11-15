// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:flutter/material.dart';
import 'package:weather_app_ui/provider/weather_provider.dart';
import 'package:weather_app_ui/screens/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<WeatherProvider>(create: (_) => WeatherProvider()),
    ], child: const MyApp()),
  );
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
