// ignore_for_file: avoid_print, unnecessary_const

/*Outfitter is a powerful weather tool that uses all aspects of local conditions
  to create an outfit for you.

  Copyright (C) 2022, Christian Thompson

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'api.dart';
import 'api/Forecast.dart';
import 'WeatherTheme.dart';

void main() {
  print(
      "Outfitter Copyright (C) 2022 Christian Thompson\n\nThis program comes with ABSOLUTELY NO WARRANTY. This is free software, and you are welcome to redistribute it under certain conditions. For more information please refer to the GNU General Public License v3.0");
  runApp(const MyApp());

  //This app in its current state will only make use of the weather.gov (NOAA) API to retrieve info, global weather api implementation is in the works
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Outfitter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Outfitter home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double opacityLevel;
  late double positionLevel;
  late Forecast _forecast;

  @override
  void initState() {
    super.initState();
    opacityLevel = 0.0;
    positionLevel = 300;
    API.getForecast().then((forecast) {
      setState(() {
        _forecast = forecast;
        Future.delayed(const Duration(seconds: 1), () {
          print("executed");
          opacityLevel = 1.0;
          positionLevel = 0;
          setState(() {});
        });
      });
    });
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  WeatherTheme day = WeatherTheme(
    [
      const Color.fromARGB(255, 15, 81, 143),
      const Color.fromARGB(255, 53, 162, 182)
    ],
    Colors.white,
  );
  WeatherTheme sunrise = WeatherTheme(
    [
      const Color.fromARGB(255, 69, 122, 182),
      const Color.fromARGB(255, 236, 214, 182)
    ],
    Colors.white,
  );
  WeatherTheme sunset = WeatherTheme(
    [
      const Color.fromARGB(255, 47, 40, 114),
      const Color.fromARGB(255, 221, 105, 10)
    ],
    Colors.white,
  );
  WeatherTheme cloudy = WeatherTheme(
    [
      const Color.fromARGB(255, 135, 134, 146),
      const Color.fromARGB(255, 64, 64, 71)
    ],
    Colors.white,
  );
  WeatherTheme night = WeatherTheme(
    [
      const Color.fromARGB(255, 22, 18, 58),
      const Color.fromARGB(255, 50, 4, 77)
    ],
    Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Outfitter",
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: sunrise.bg,
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
