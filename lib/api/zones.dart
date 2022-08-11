import 'dart:convert';

Zones alertsFromJson(String str) => Zones.fromJson(json.decode(str));

class Zones {
  String? type;
  List<Features>? features;

  Zones({this.type, this.features});

  Zones.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  String? id;
  String? type;
  Properties? properties;

  Features({this.id, this.type, this.properties});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    return data;
  }
}

class Properties {
  String? geometry;
  String? id;
  String? type;
  String? id;
  String? type;
  String? name;
  String? effectiveDate;
  String? expirationDate;
  List<String>? cwa;
  List<String>? forecastOffices;
  List<String>? timeZone;
  List<String>? observationStations;
  String? radarStation;

  Properties(
      {this.geometry,
      this.id,
      this.type,
      this.id,
      this.type,
      this.name,
      this.effectiveDate,
      this.expirationDate,
      this.cwa,
      this.forecastOffices,
      this.timeZone,
      this.observationStations,
      this.radarStation});

  Properties.fromJson(Map<String, dynamic> json) {
    geometry = json['geometry'];
    id = json['@id'];
    type = json['@type'];
    id = json['id'];
    type = json['type'];
    name = json['name'];
    effectiveDate = json['effectiveDate'];
    expirationDate = json['expirationDate'];
    cwa = json['cwa'].cast<String>();
    forecastOffices = json['forecastOffices'].cast<String>();
    timeZone = json['timeZone'].cast<String>();
    observationStations = json['observationStations'].cast<String>();
    radarStation = json['radarStation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geometry'] = this.geometry;
    data['@id'] = this.id;
    data['@type'] = this.type;
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['effectiveDate'] = this.effectiveDate;
    data['expirationDate'] = this.expirationDate;
    data['cwa'] = this.cwa;
    data['forecastOffices'] = this.forecastOffices;
    data['timeZone'] = this.timeZone;
    data['observationStations'] = this.observationStations;
    data['radarStation'] = this.radarStation;
    return data;
  }
}
