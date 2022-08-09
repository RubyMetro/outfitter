import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api/Alerts.dart';

class Services {
  static const String url = 'https://api.weather.gov/alerts/active?zone=TXZ130';

  static Future<Alerts> getAlerts() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final alerts = Alerts.fromJson(response.body.toString());
        return alerts;
      } else {
        throw Exception("unable to fetch alerts at this time");
      }
    } catch (e) {
      throw Exception("unable to fetch alerts at this time");
    }
  }
}
