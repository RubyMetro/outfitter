import 'dart:async';
import 'package:http/http.dart' as http;
import 'api/alerts.dart';

const String area = 'NC';

class API {
  static Future<Alerts> getAlerts() async {
    const String url = 'https://api.weather.gov/alerts/active?area=$area';
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final alerts = alertsFromJson(response.body);
        return alerts;
      } else {
        throw Exception("unable to fetch alerts at this time");
      }
    } catch (e) {
      throw Exception("unable to fetch alerts at this time");
    }
  }
}
