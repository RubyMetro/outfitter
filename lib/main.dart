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
import 'api/Forecast.dart';
import 'api.dart';

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

  @override
  void initState() {
    super.initState();
    _loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'loading' : "loaded"),
      ),
    );
  }
}
