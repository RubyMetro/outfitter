// To parse this JSON data, do
//
//     final alerts = alertsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Alerts {
  Alerts({
    @required this.context,
    @required this.type,
    @required this.features,
    @required this.title,
    @required this.updated,
  });

  final List<dynamic> context;
  final String type;
  final List<Feature> features;
  final String title;
  final DateTime updated;

  factory Alerts.fromRawJson(String str) => Alerts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Alerts.fromJson(Map<String, dynamic> json) => Alerts(
        context: List<dynamic>.from(json["@context"].map((x) => x)),
        type: json["type"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
        title: json["title"],
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "@context": List<dynamic>.from(context.map((x) => x)),
        "type": type,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "title": title,
        "updated": updated.toIso8601String(),
      };
}

class ContextClass {
  ContextClass({
    @required this.version,
    @required this.wx,
    @required this.vocab,
  });

  final String version;
  final String wx;
  final String vocab;

  factory ContextClass.fromRawJson(String str) =>
      ContextClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContextClass.fromJson(Map<String, dynamic> json) => ContextClass(
        version: json["@version"],
        wx: json["wx"],
        vocab: json["@vocab"],
      );

  Map<String, dynamic> toJson() => {
        "@version": version,
        "wx": wx,
        "@vocab": vocab,
      };
}

class Feature {
  Feature({
    @required this.id,
    @required this.type,
    @required this.geometry,
    @required this.properties,
  });

  final String id;
  final String type;
  final Geometry geometry;
  final Properties properties;

  factory Feature.fromRawJson(String str) => Feature.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        geometry: Geometry.fromJson(json["geometry"]),
        properties: Properties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "geometry": geometry.toJson(),
        "properties": properties.toJson(),
      };
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  final String type;
  final List<List<List<double>>> coordinates;

  factory Geometry.fromRawJson(String str) =>
      Geometry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: List<List<List<double>>>.from(json["coordinates"].map(
            (x) => List<List<double>>.from(
                x.map((x) => List<double>.from(x.map((x) => x.toDouble())))))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) =>
            List<dynamic>.from(
                x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
      };
}

class Properties {
  Properties({
    required this.id,
    required this.type,
    required this.propertiesId,
    required this.areaDesc,
    required this.geocode,
    required this.affectedZones,
    required this.references,
    required this.sent,
    required this.effective,
    required this.onset,
    required this.expires,
    required this.ends,
    required this.status,
    required this.messageType,
    required this.category,
    required this.severity,
    required this.certainty,
    required this.urgency,
    required this.event,
    required this.sender,
    required this.senderName,
    required this.headline,
    required this.description,
    required this.instruction,
    required this.response,
    required this.parameters,
  });

  final String id;
  final String type;
  final String propertiesId;
  final String areaDesc;
  final Geocode geocode;
  final List<String> affectedZones;
  final List<dynamic> references;
  final DateTime sent;
  final DateTime effective;
  final DateTime onset;
  final DateTime expires;
  final DateTime ends;
  final String status;
  final String messageType;
  final String category;
  final String severity;
  final String certainty;
  final String urgency;
  final String event;
  final String sender;
  final String senderName;
  final String headline;
  final String description;
  final String instruction;
  final String response;
  final Map<String, List<String>> parameters;

  factory Properties.fromRawJson(String str) =>
      Properties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        id: json["@id"],
        type: json["@type"],
        propertiesId: json["id"],
        areaDesc: json["areaDesc"],
        geocode: Geocode.fromJson(json["geocode"]),
        affectedZones: List<String>.from(json["affectedZones"].map((x) => x)),
        references: List<dynamic>.from(json["references"].map((x) => x)),
        sent: DateTime.parse(json["sent"]),
        effective: DateTime.parse(json["effective"]),
        onset: DateTime.parse(json["onset"]),
        expires: DateTime.parse(json["expires"]),
        ends: DateTime.parse(json["ends"]),
        status: json["status"],
        messageType: json["messageType"],
        category: json["category"],
        severity: json["severity"],
        certainty: json["certainty"],
        urgency: json["urgency"],
        event: json["event"],
        sender: json["sender"],
        senderName: json["senderName"],
        headline: json["headline"],
        description: json["description"],
        instruction: json["instruction"],
        response: json["response"],
        parameters: Map.from(json["parameters"]).map((k, v) =>
            MapEntry<String, List<String>>(
                k, List<String>.from(v.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "id": propertiesId,
        "areaDesc": areaDesc,
        "geocode": geocode.toJson(),
        "affectedZones": List<dynamic>.from(affectedZones.map((x) => x)),
        "references": List<dynamic>.from(references.map((x) => x)),
        "sent": sent.toIso8601String(),
        "effective": effective.toIso8601String(),
        "onset": onset.toIso8601String(),
        "expires": expires.toIso8601String(),
        "ends": ends == null ? null : ends.toIso8601String(),
        "status": status,
        "messageType": messageType,
        "category": category,
        "severity": severity,
        "certainty": certainty,
        "urgency": urgency,
        "event": event,
        "sender": sender,
        "senderName": senderName,
        "headline": headline,
        "description": description,
        "instruction": instruction,
        "response": response,
        "parameters": Map.from(parameters).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
      };
}

class Geocode {
  Geocode({
    required this.same,
    required this.ugc,
  });

  final List<String> same;
  final List<String> ugc;

  factory Geocode.fromRawJson(String str) => Geocode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Geocode.fromJson(Map<String, dynamic> json) => Geocode(
        same: List<String>.from(json["SAME"].map((x) => x)),
        ugc: List<String>.from(json["UGC"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "SAME": List<dynamic>.from(same.map((x) => x)),
        "UGC": List<dynamic>.from(ugc.map((x) => x)),
      };
}
