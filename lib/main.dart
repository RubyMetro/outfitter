// ignore_for_file: avoid_print

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
import 'api.dart';
import 'api/Forecast.dart';

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
  }

  List<Color> day = [
    const Color.fromARGB(255, 15, 81, 143),
    const Color.fromARGB(255, 53, 162, 182)
  ];
  List<Color> sunrise = [
    const Color.fromARGB(255, 69, 122, 182),
    const Color.fromARGB(255, 221, 130, 10)
  ];
  List<Color> sunset = [
    const Color.fromARGB(255, 47, 40, 114),
    const Color.fromARGB(255, 221, 105, 10)
  ];
  List<Color> cloudy = [
    const Color.fromARGB(255, 135, 134, 146),
    const Color.fromARGB(255, 64, 64, 71)
  ];
  List<Color> night = [
    const Color.fromARGB(255, 22, 18, 58),
    const Color.fromARGB(255, 50, 4, 77)
  ];

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
            colors: day,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Welcome,\nJane.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      width: double.infinity,
                      constraints:
                          const BoxConstraints(maxHeight: 800, minHeight: 100),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        color: Color.fromARGB(43, 255, 255, 255),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 300,
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          child: Container(
                                            constraints: const BoxConstraints(
                                              maxHeight: 200,
                                              maxWidth: 200,
                                            ),
                                            child: const Image(
                                              image: AssetImage(
                                                  'images/placeholder.jpg'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 5,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        height: 100,
                                        width: 100,
                                        child: const Padding(
                                          padding: EdgeInsets.all(5),
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              "bottom Placeholder",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 5,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        height: 100,
                                        width: 100,
                                        child: const Padding(
                                          padding: EdgeInsets.all(5),
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              "Coat Placeholder",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 5,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        height: 100,
                                        width: 100,
                                        child: const Padding(
                                          padding: EdgeInsets.all(5),
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              "Sunscreen\nPlaceholder",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 5,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        height: 100,
                                        width: 100,
                                        child: const Padding(
                                          padding: EdgeInsets.all(5),
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              "Umbrella\nPlaceholder",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 600,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
