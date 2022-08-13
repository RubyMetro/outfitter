// ignore_for_file: file_names

import 'dart:convert';

Forecast forecastFromJson(String str) => Forecast.fromJson(json.decode(str));

class Forecast {
  String? location;
  num? lattitude;
  num? longitude;
  num? altitude;
  CurrentForecast? currentForecast;
  OneHourForecast? oneHourForecast;
  SixHourForecast? sixHourForecast;
  TwelveHourForecast? twelveHourForecast;
  String? status;

  Forecast(
      {this.location,
      this.lattitude,
      this.longitude,
      this.altitude,
      this.currentForecast,
      this.oneHourForecast,
      this.sixHourForecast,
      this.twelveHourForecast,
      this.status});

  Forecast.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    lattitude = json['lattitude'];
    longitude = json['longitude'];
    altitude = json['altitude'];
    currentForecast = json['currentForecast'] != null
        ? CurrentForecast.fromJson(json['currentForecast'])
        : null;
    oneHourForecast = json['one_hour_forecast'] != null
        ? OneHourForecast.fromJson(json['one_hour_forecast'])
        : null;
    sixHourForecast = json['six_hour_forecast'] != null
        ? SixHourForecast.fromJson(json['six_hour_forecast'])
        : null;
    twelveHourForecast = json['twelve_hour_forecast'] != null
        ? TwelveHourForecast.fromJson(json['twelve_hour_forecast'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location;
    data['lattitude'] = lattitude;
    data['longitude'] = longitude;
    data['altitude'] = altitude;
    if (currentForecast != null) {
      data['currentForecast'] = currentForecast!.toJson();
    }
    if (oneHourForecast != null) {
      data['one_hour_forecast'] = oneHourForecast!.toJson();
    }
    if (sixHourForecast != null) {
      data['six_hour_forecast'] = sixHourForecast!.toJson();
    }
    if (twelveHourForecast != null) {
      data['twelve_hour_forecast'] = twelveHourForecast!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class CurrentForecast {
  num? airPressureAtSeaLevel;
  num? airTemperature;
  num? cloudAreaFraction;
  num? cloudAreaFractionHigh;
  num? cloudAreaFractionLow;
  num? cloudAreaFractionMedium;
  num? dewPointTemperature;
  num? fogAreaFraction;
  num? relativeHumidity;
  num? ultravioletIndexClearSky;
  num? windFromDirection;
  num? windSpeed;
  num? minAirTemperature;
  num? maxAirTemperature;

  CurrentForecast(
      {this.airPressureAtSeaLevel,
      this.airTemperature,
      this.cloudAreaFraction,
      this.cloudAreaFractionHigh,
      this.cloudAreaFractionLow,
      this.cloudAreaFractionMedium,
      this.dewPointTemperature,
      this.fogAreaFraction,
      this.relativeHumidity,
      this.ultravioletIndexClearSky,
      this.windFromDirection,
      this.windSpeed,
      this.minAirTemperature,
      this.maxAirTemperature});

  CurrentForecast.fromJson(Map<String, dynamic> json) {
    airPressureAtSeaLevel = json['air_pressure_at_sea_level'];
    airTemperature = json['air_temperature'];
    cloudAreaFraction = json['cloud_area_fraction'];
    cloudAreaFractionHigh = json['cloud_area_fraction_high'];
    cloudAreaFractionLow = json['cloud_area_fraction_low'];
    cloudAreaFractionMedium = json['cloud_area_fraction_medium'];
    dewPointTemperature = json['dew_point_temperature'];
    fogAreaFraction = json['fog_area_fraction'];
    relativeHumidity = json['relative_humidity'];
    ultravioletIndexClearSky = json['ultraviolet_index_clear_sky'];
    windFromDirection = json['wind_from_direction'];
    windSpeed = json['wind_speed'];
    minAirTemperature = json['min_air_temperature'];
    maxAirTemperature = json['max_air_temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['air_pressure_at_sea_level'] = airPressureAtSeaLevel;
    data['air_temperature'] = airTemperature;
    data['cloud_area_fraction'] = cloudAreaFraction;
    data['cloud_area_fraction_high'] = cloudAreaFractionHigh;
    data['cloud_area_fraction_low'] = cloudAreaFractionLow;
    data['cloud_area_fraction_medium'] = cloudAreaFractionMedium;
    data['dew_point_temperature'] = dewPointTemperature;
    data['fog_area_fraction'] = fogAreaFraction;
    data['relative_humidity'] = relativeHumidity;
    data['ultraviolet_index_clear_sky'] = ultravioletIndexClearSky;
    data['wind_from_direction'] = windFromDirection;
    data['wind_speed'] = windSpeed;
    data['min_air_temperature'] = minAirTemperature;
    data['max_air_temperature'] = maxAirTemperature;
    return data;
  }
}

class OneHourForecast {
  num? precipitationAmount;

  OneHourForecast({this.precipitationAmount});

  OneHourForecast.fromJson(Map<String, dynamic> json) {
    precipitationAmount = json['precipitation_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['precipitation_amount'] = precipitationAmount;
    return data;
  }
}

class SixHourForecast {
  num? airPressureAtSeaLevel;
  num? airTemperature;
  num? cloudAreaFraction;
  num? cloudAreaFractionHigh;
  num? cloudAreaFractionLow;
  num? cloudAreaFractionMedium;
  num? dewPointTemperature;
  num? fogAreaFraction;
  num? relativeHumidity;
  num? ultravioletIndexClearSky;
  num? windFromDirection;
  num? windSpeed;
  num? precipitationAmount;
  num? minAirTemperature;
  num? maxAirTemperature;

  SixHourForecast(
      {this.airPressureAtSeaLevel,
      this.airTemperature,
      this.cloudAreaFraction,
      this.cloudAreaFractionHigh,
      this.cloudAreaFractionLow,
      this.cloudAreaFractionMedium,
      this.dewPointTemperature,
      this.fogAreaFraction,
      this.relativeHumidity,
      this.ultravioletIndexClearSky,
      this.windFromDirection,
      this.windSpeed,
      this.precipitationAmount,
      this.minAirTemperature,
      this.maxAirTemperature});

  SixHourForecast.fromJson(Map<String, dynamic> json) {
    airPressureAtSeaLevel = json['air_pressure_at_sea_level'];
    airTemperature = json['air_temperature'];
    cloudAreaFraction = json['cloud_area_fraction'];
    cloudAreaFractionHigh = json['cloud_area_fraction_high'];
    cloudAreaFractionLow = json['cloud_area_fraction_low'];
    cloudAreaFractionMedium = json['cloud_area_fraction_medium'];
    dewPointTemperature = json['dew_point_temperature'];
    fogAreaFraction = json['fog_area_fraction'];
    relativeHumidity = json['relative_humidity'];
    ultravioletIndexClearSky = json['ultraviolet_index_clear_sky'];
    windFromDirection = json['wind_from_direction'];
    windSpeed = json['wind_speed'];
    precipitationAmount = json['precipitation_amount'];
    minAirTemperature = json['min_air_temperature'];
    maxAirTemperature = json['max_air_temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['air_pressure_at_sea_level'] = airPressureAtSeaLevel;
    data['air_temperature'] = airTemperature;
    data['cloud_area_fraction'] = cloudAreaFraction;
    data['cloud_area_fraction_high'] = cloudAreaFractionHigh;
    data['cloud_area_fraction_low'] = cloudAreaFractionLow;
    data['cloud_area_fraction_medium'] = cloudAreaFractionMedium;
    data['dew_point_temperature'] = dewPointTemperature;
    data['fog_area_fraction'] = fogAreaFraction;
    data['relative_humidity'] = relativeHumidity;
    data['ultraviolet_index_clear_sky'] = ultravioletIndexClearSky;
    data['wind_from_direction'] = windFromDirection;
    data['wind_speed'] = windSpeed;
    data['precipitation_amount'] = precipitationAmount;
    data['min_air_temperature'] = minAirTemperature;
    data['max_air_temperature'] = maxAirTemperature;
    return data;
  }
}

class TwelveHourForecast {
  num? airPressureAtSeaLevel;
  num? airTemperature;
  num? cloudAreaFraction;
  num? cloudAreaFractionHigh;
  num? cloudAreaFractionLow;
  num? cloudAreaFractionMedium;
  num? dewPointTemperature;
  num? fogAreaFraction;
  num? relativeHumidity;
  num? ultravioletIndexClearSky;
  num? windFromDirection;
  num? windSpeed;
  num? minAirTemperature;
  num? maxAirTemperature;
  num? precipitationAmount;

  TwelveHourForecast(
      {this.airPressureAtSeaLevel,
      this.airTemperature,
      this.cloudAreaFraction,
      this.cloudAreaFractionHigh,
      this.cloudAreaFractionLow,
      this.cloudAreaFractionMedium,
      this.dewPointTemperature,
      this.fogAreaFraction,
      this.relativeHumidity,
      this.ultravioletIndexClearSky,
      this.windFromDirection,
      this.windSpeed,
      this.minAirTemperature,
      this.maxAirTemperature,
      this.precipitationAmount});

  TwelveHourForecast.fromJson(Map<String, dynamic> json) {
    airPressureAtSeaLevel = json['air_pressure_at_sea_level'];
    airTemperature = json['air_temperature'];
    cloudAreaFraction = json['cloud_area_fraction'];
    cloudAreaFractionHigh = json['cloud_area_fraction_high'];
    cloudAreaFractionLow = json['cloud_area_fraction_low'];
    cloudAreaFractionMedium = json['cloud_area_fraction_medium'];
    dewPointTemperature = json['dew_point_temperature'];
    fogAreaFraction = json['fog_area_fraction'];
    relativeHumidity = json['relative_humidity'];
    ultravioletIndexClearSky = json['ultraviolet_index_clear_sky'];
    windFromDirection = json['wind_from_direction'];
    windSpeed = json['wind_speed'];
    minAirTemperature = json['min_air_temperature'];
    maxAirTemperature = json['max_air_temperature'];
    precipitationAmount = json['precipitation_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['air_pressure_at_sea_level'] = airPressureAtSeaLevel;
    data['air_temperature'] = airTemperature;
    data['cloud_area_fraction'] = cloudAreaFraction;
    data['cloud_area_fraction_high'] = cloudAreaFractionHigh;
    data['cloud_area_fraction_low'] = cloudAreaFractionLow;
    data['cloud_area_fraction_medium'] = cloudAreaFractionMedium;
    data['dew_point_temperature'] = dewPointTemperature;
    data['fog_area_fraction'] = fogAreaFraction;
    data['relative_humidity'] = relativeHumidity;
    data['ultraviolet_index_clear_sky'] = ultravioletIndexClearSky;
    data['wind_from_direction'] = windFromDirection;
    data['wind_speed'] = windSpeed;
    data['min_air_temperature'] = minAirTemperature;
    data['max_air_temperature'] = maxAirTemperature;
    data['precipitation_amount'] = precipitationAmount;
    return data;
  }
}
