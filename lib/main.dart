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
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<Alerts> fetchAlerts() async {
  final response = await http
      .get(Uri.parse('https://api.weather.gov/alerts/active?zone=TXZ130'));

  if (response.statusCode == 200) {
    //server returned ok!
    //parse json
    return Alerts.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to fetch alerts for your area.");
  }
}

class Alerts {
  final String status;
  final String msgType;

  const Alerts({
    required this.status,
    required this.msgType,
  });

  factory Alerts.fromJson(Map<String, dynamic> json) {
    return Alerts(
      status: json['status'],
      msgType: json['messageType'],
    );
  }
}

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
  int _counter = 0;
  late Future<Alerts> alerts;

  @override
  void initState() {
    super.initState();
    alerts = fetchAlerts();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Alerts>(
              future: alerts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.status);
                } else if (snapshot.hasError) {
                  return const Text('an error occured. please try again.');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
