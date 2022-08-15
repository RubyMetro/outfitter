import 'dart:async';
import 'package:http/http.dart' as http;
import 'api/Forecast.dart';

const String address = '5338 Golden Triangle Boulevard';

class API {
  static Future<Forecast> getForecast() async {
    String url = 'http://10.0.2.2:8080/outfitter/forecast/position=$address';
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final forecast = forecastFromJson(response.body);
        return forecast;
      } else {
        throw Exception("unable to fetch alerts at this time");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
