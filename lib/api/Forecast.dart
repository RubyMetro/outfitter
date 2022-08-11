// ignore_for_file: file_names

import 'dart:convert';

Forecast alertsFromJson(String str) => Forecast.fromJson(json.decode(str));

class Forecast {
  Geometry? geometry;
  Properties? properties;
  String? type;

  Forecast({this.geometry, this.properties, this.type});

  Forecast.fromJson(Map<String, dynamic> json) {
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class Geometry {
  List<double>? coordinates;
  String? type;

  Geometry({this.coordinates, this.type});

  Geometry.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}

class Properties {
  Meta? meta;
  List<Timeseries>? timeseries;

  Properties({this.meta, this.timeseries});

  Properties.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['timeseries'] != null) {
      timeseries = <Timeseries>[];
      json['timeseries'].forEach((v) {
        timeseries!.add(new Timeseries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.timeseries != null) {
      data['timeseries'] = this.timeseries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  Units? units;
  String? updatedAt;

  Meta({this.units, this.updatedAt});

  Meta.fromJson(Map<String, dynamic> json) {
    units = json['units'] != null ? new Units.fromJson(json['units']) : null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.units != null) {
      data['units'] = this.units!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Units {
  String? airPressureAtSeaLevel;
  String? airTemperature;
  String? airTemperatureMax;
  String? airTemperatureMin;
  String? cloudAreaFraction;
  String? cloudAreaFractionHigh;
  String? cloudAreaFractionLow;
  String? cloudAreaFractionMedium;
  String? dewPointTemperature;
  String? fogAreaFraction;
  String? precipitationAmount;
  String? precipitationAmountMax;
  String? precipitationAmountMin;
  String? probabilityOfPrecipitation;
  String? probabilityOfThunder;
  String? relativeHumidity;
  String? ultravioletIndexClearSkyMax;
  String? windFromDirection;
  String? windSpeed;
  String? windSpeedOfGust;

  Units(
      {this.airPressureAtSeaLevel,
      this.airTemperature,
      this.airTemperatureMax,
      this.airTemperatureMin,
      this.cloudAreaFraction,
      this.cloudAreaFractionHigh,
      this.cloudAreaFractionLow,
      this.cloudAreaFractionMedium,
      this.dewPointTemperature,
      this.fogAreaFraction,
      this.precipitationAmount,
      this.precipitationAmountMax,
      this.precipitationAmountMin,
      this.probabilityOfPrecipitation,
      this.probabilityOfThunder,
      this.relativeHumidity,
      this.ultravioletIndexClearSkyMax,
      this.windFromDirection,
      this.windSpeed,
      this.windSpeedOfGust});

  Units.fromJson(Map<String, dynamic> json) {
    airPressureAtSeaLevel = json['air_pressure_at_sea_level'];
    airTemperature = json['air_temperature'];
    airTemperatureMax = json['air_temperature_max'];
    airTemperatureMin = json['air_temperature_min'];
    cloudAreaFraction = json['cloud_area_fraction'];
    cloudAreaFractionHigh = json['cloud_area_fraction_high'];
    cloudAreaFractionLow = json['cloud_area_fraction_low'];
    cloudAreaFractionMedium = json['cloud_area_fraction_medium'];
    dewPointTemperature = json['dew_point_temperature'];
    fogAreaFraction = json['fog_area_fraction'];
    precipitationAmount = json['precipitation_amount'];
    precipitationAmountMax = json['precipitation_amount_max'];
    precipitationAmountMin = json['precipitation_amount_min'];
    probabilityOfPrecipitation = json['probability_of_precipitation'];
    probabilityOfThunder = json['probability_of_thunder'];
    relativeHumidity = json['relative_humidity'];
    ultravioletIndexClearSkyMax = json['ultraviolet_index_clear_sky_max'];
    windFromDirection = json['wind_from_direction'];
    windSpeed = json['wind_speed'];
    windSpeedOfGust = json['wind_speed_of_gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_pressure_at_sea_level'] = this.airPressureAtSeaLevel;
    data['air_temperature'] = this.airTemperature;
    data['air_temperature_max'] = this.airTemperatureMax;
    data['air_temperature_min'] = this.airTemperatureMin;
    data['cloud_area_fraction'] = this.cloudAreaFraction;
    data['cloud_area_fraction_high'] = this.cloudAreaFractionHigh;
    data['cloud_area_fraction_low'] = this.cloudAreaFractionLow;
    data['cloud_area_fraction_medium'] = this.cloudAreaFractionMedium;
    data['dew_point_temperature'] = this.dewPointTemperature;
    data['fog_area_fraction'] = this.fogAreaFraction;
    data['precipitation_amount'] = this.precipitationAmount;
    data['precipitation_amount_max'] = this.precipitationAmountMax;
    data['precipitation_amount_min'] = this.precipitationAmountMin;
    data['probability_of_precipitation'] = this.probabilityOfPrecipitation;
    data['probability_of_thunder'] = this.probabilityOfThunder;
    data['relative_humidity'] = this.relativeHumidity;
    data['ultraviolet_index_clear_sky_max'] = this.ultravioletIndexClearSkyMax;
    data['wind_from_direction'] = this.windFromDirection;
    data['wind_speed'] = this.windSpeed;
    data['wind_speed_of_gust'] = this.windSpeedOfGust;
    return data;
  }
}

class Timeseries {
  Data? data;
  String? time;

  Timeseries({this.data, this.time});

  Timeseries.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class Data {
  Instant? instant;
  Next12Hours? next12Hours;
  Next12Hours? next1Hours;
  Next12Hours? next6Hours;

  Data({this.instant, this.next12Hours, this.next1Hours, this.next6Hours});

  Data.fromJson(Map<String, dynamic> json) {
    instant =
        json['instant'] != null ? new Instant.fromJson(json['instant']) : null;
    next12Hours = json['next_12_hours'] != null
        ? new Next12Hours.fromJson(json['next_12_hours'])
        : null;
    next1Hours = json['next_1_hours'] != null
        ? new Next12Hours.fromJson(json['next_1_hours'])
        : null;
    next6Hours = json['next_6_hours'] != null
        ? new Next12Hours.fromJson(json['next_6_hours'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.instant != null) {
      data['instant'] = this.instant!.toJson();
    }
    if (this.next12Hours != null) {
      data['next_12_hours'] = this.next12Hours!.toJson();
    }
    if (this.next1Hours != null) {
      data['next_1_hours'] = this.next1Hours!.toJson();
    }
    if (this.next6Hours != null) {
      data['next_6_hours'] = this.next6Hours!.toJson();
    }
    return data;
  }
}

class Instant {
  Details? details;

  Instant({this.details});

  Instant.fromJson(Map<String, dynamic> json) {
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  double? airPressureAtSeaLevel;
  double? airTemperature;
  double? cloudAreaFraction;
  double? cloudAreaFractionHigh;
  double? cloudAreaFractionLow;
  double? cloudAreaFractionMedium;
  double? dewPointTemperature;
  double? fogAreaFraction;
  double? relativeHumidity;
  double? windFromDirection;
  double? windSpeed;
  double? windSpeedOfGust;

  Details(
      {this.airPressureAtSeaLevel,
      this.airTemperature,
      this.cloudAreaFraction,
      this.cloudAreaFractionHigh,
      this.cloudAreaFractionLow,
      this.cloudAreaFractionMedium,
      this.dewPointTemperature,
      this.fogAreaFraction,
      this.relativeHumidity,
      this.windFromDirection,
      this.windSpeed,
      this.windSpeedOfGust});

  Details.fromJson(Map<String, dynamic> json) {
    airPressureAtSeaLevel = json['air_pressure_at_sea_level'];
    airTemperature = json['air_temperature'];
    cloudAreaFraction = json['cloud_area_fraction'];
    cloudAreaFractionHigh = json['cloud_area_fraction_high'];
    cloudAreaFractionLow = json['cloud_area_fraction_low'];
    cloudAreaFractionMedium = json['cloud_area_fraction_medium'];
    dewPointTemperature = json['dew_point_temperature'];
    fogAreaFraction = json['fog_area_fraction'];
    relativeHumidity = json['relative_humidity'];
    windFromDirection = json['wind_from_direction'];
    windSpeed = json['wind_speed'];
    windSpeedOfGust = json['wind_speed_of_gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_pressure_at_sea_level'] = this.airPressureAtSeaLevel;
    data['air_temperature'] = this.airTemperature;
    data['cloud_area_fraction'] = this.cloudAreaFraction;
    data['cloud_area_fraction_high'] = this.cloudAreaFractionHigh;
    data['cloud_area_fraction_low'] = this.cloudAreaFractionLow;
    data['cloud_area_fraction_medium'] = this.cloudAreaFractionMedium;
    data['dew_point_temperature'] = this.dewPointTemperature;
    data['fog_area_fraction'] = this.fogAreaFraction;
    data['relative_humidity'] = this.relativeHumidity;
    data['wind_from_direction'] = this.windFromDirection;
    data['wind_speed'] = this.windSpeed;
    data['wind_speed_of_gust'] = this.windSpeedOfGust;
    return data;
  }
}

class Next12Hours {
  Details? details;
  Summary? summary;

  Next12Hours({this.details, this.summary});

  Next12Hours.fromJson(Map<String, dynamic> json) {
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class lateDetails {
  double? airTemperatureMax;
  double? airTemperatureMin;
  double? precipitationAmount;
  double? precipitationAmountMax;
  double? precipitationAmountMin;
  int? probabilityOfPrecipitation;
  double? probabilityOfThunder;
  int? ultravioletIndexClearSkyMax;

  lateDetails(
      {this.airTemperatureMax,
      this.airTemperatureMin,
      this.precipitationAmount,
      this.precipitationAmountMax,
      this.precipitationAmountMin,
      this.probabilityOfPrecipitation,
      this.probabilityOfThunder,
      this.ultravioletIndexClearSkyMax});

  lateDetails.fromJson(Map<String, dynamic> json) {
    airTemperatureMax = json['air_temperature_max'];
    airTemperatureMin = json['air_temperature_min'];
    precipitationAmount = json['precipitation_amount'];
    precipitationAmountMax = json['precipitation_amount_max'];
    precipitationAmountMin = json['precipitation_amount_min'];
    probabilityOfPrecipitation = json['probability_of_precipitation'];
    probabilityOfThunder = json['probability_of_thunder'];
    ultravioletIndexClearSkyMax = json['ultraviolet_index_clear_sky_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_temperature_max'] = this.airTemperatureMax;
    data['air_temperature_min'] = this.airTemperatureMin;
    data['precipitation_amount'] = this.precipitationAmount;
    data['precipitation_amount_max'] = this.precipitationAmountMax;
    data['precipitation_amount_min'] = this.precipitationAmountMin;
    data['probability_of_precipitation'] = this.probabilityOfPrecipitation;
    data['probability_of_thunder'] = this.probabilityOfThunder;
    data['ultraviolet_index_clear_sky_max'] = this.ultravioletIndexClearSkyMax;
    return data;
  }
}

class Summary {
  String? symbolCode;

  Summary({this.symbolCode});

  Summary.fromJson(Map<String, dynamic> json) {
    symbolCode = json['symbol_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol_code'] = this.symbolCode;
    return data;
  }
}
