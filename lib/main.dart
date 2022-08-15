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
  late bool _loading;
  late Forecast _forecast;

  @override
  void initState() {
    super.initState();
    _loading = true;
    API.getForecast().then((forecast) {
      setState(() {
        _forecast = forecast;
        _loading = false;
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
            colors: night.bg,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  child: Text(
                    "Hello,\nZoe!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        width: 5,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Today's Outfit",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        _loading
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    color: Color.fromARGB(55, 0, 0, 0),
                                  ),
                                  width: double.infinity,
                                  constraints:
                                      const BoxConstraints(maxHeight: 100),
                                  clipBehavior: Clip.hardEdge,
                                  child: const SizedBox(
                                    height: 200,
                                    child: const Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 5,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          color: Color.fromARGB(55, 0, 0, 0),
                                        ),
                                        height: 100,
                                        clipBehavior: Clip.hardEdge,
                                        child: const Image(
                                          image: AssetImage(
                                              'images/Light_Shirt_.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          color: Color.fromARGB(55, 0, 0, 0),
                                        ),
                                        height: 100,
                                        clipBehavior: Clip.hardEdge,
                                        child: const Image(
                                          image:
                                              AssetImage('images/Shorts.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          color: Color.fromARGB(55, 0, 0, 0),
                                        ),
                                        constraints: const BoxConstraints(
                                            maxHeight: 200),
                                        clipBehavior: Clip.hardEdge,
                                        child: const Image(
                                          image: AssetImage(
                                              'images/Sunscreen_.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        const Text(
                          "Current Forecast",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Color.fromARGB(55, 0, 0, 0),
                            ),
                            width: double.infinity,
                            constraints: const BoxConstraints(maxHeight: 200),
                            clipBehavior: Clip.hardEdge,
                            child: _loading
                                ? const SizedBox(
                                    height: 200,
                                    child: Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 5,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "${_forecast.currentForecast?.airTemperature}",
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: const [
                                                  Text(
                                                    "C°",
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.thermostat_outlined,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "${_forecast.currentForecast?.relativeHumidity}",
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: const [
                                                  Text(
                                                    "%",
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.water_drop_outlined,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "${_forecast.oneHourForecast?.precipitationAmount}",
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: const [
                                                  Text(
                                                    "%",
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.shower_outlined,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "${_forecast.currentForecast?.ultravioletIndexClearSky}",
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: const [
                                                  Text(
                                                    "UVI",
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.wb_sunny_outlined,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "${_forecast.currentForecast?.windSpeed}",
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: const [
                                                  Text(
                                                    "M/S",
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.air_outlined,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
