//this file handles all api requests
//currently specific zones are not supported, this will be added very soon and can be accessed in the command window
//please refer to NOAA website for zones with active alerts/weather/etc. for testing

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

//NOTE: this code will be completely rewritten in the next commit as it does not work and results in an error because objects are not properly structured
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
