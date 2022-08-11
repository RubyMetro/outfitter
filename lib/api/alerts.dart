// ignore_for_file: file_names

import 'dart:convert';

Alerts alertsFromJson(String str) => Alerts.fromJson(json.decode(str));

class Alerts {
  late String type;
  late List<Features> features;
  late String title;
  late String updated;
  Pagination? pagination;

  Alerts(
      {required this.type,
      required this.features,
      required this.title,
      required this.updated,
      this.pagination});

  Alerts.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features.add(Features.fromJson(v));
      });
    }
    title = json['title'];
    updated = json['updated'];
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['features'] = features.map((v) => v.toJson()).toList();
    data['title'] = title;
    data['updated'] = updated;
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
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
        ? Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (properties != null) {
      data['properties'] = properties!.toJson();
    }
    return data;
  }
}

class Properties {
  String? id;
  String? areaDesc;
  Geocode? geocode;
  List<String>? affectedZones;
  List<References>? references;
  String? sent;
  String? effective;
  String? onset;
  String? expires;
  String? ends;
  String? status;
  String? messageType;
  String? category;
  String? severity;
  String? certainty;
  String? urgency;
  String? event;
  String? sender;
  String? senderName;
  String? headline;
  String? description;
  String? instruction;
  String? response;

  Properties(
      {this.id,
      this.areaDesc,
      this.geocode,
      this.affectedZones,
      this.references,
      this.sent,
      this.effective,
      this.onset,
      this.expires,
      this.ends,
      this.status,
      this.messageType,
      this.category,
      this.severity,
      this.certainty,
      this.urgency,
      this.event,
      this.sender,
      this.senderName,
      this.headline,
      this.description,
      this.instruction,
      this.response});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaDesc = json['areaDesc'];
    geocode =
        json['geocode'] != null ? Geocode.fromJson(json['geocode']) : null;
    affectedZones = json['affectedZones'].cast<String>();
    if (json['references'] != null) {
      references = <References>[];
      json['references'].forEach((v) {
        references!.add(References.fromJson(v));
      });
    }
    sent = json['sent'];
    effective = json['effective'];
    onset = json['onset'];
    expires = json['expires'];
    ends = json['ends'];
    status = json['status'];
    messageType = json['messageType'];
    category = json['category'];
    severity = json['severity'];
    certainty = json['certainty'];
    urgency = json['urgency'];
    event = json['event'];
    sender = json['sender'];
    senderName = json['senderName'];
    headline = json['headline'];
    description = json['description'];
    instruction = json['instruction'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['areaDesc'] = areaDesc;
    if (geocode != null) {
      data['geocode'] = geocode!.toJson();
    }
    data['affectedZones'] = affectedZones;
    if (references != null) {
      data['references'] = references!.map((v) => v.toJson()).toList();
    }
    data['sent'] = sent;
    data['effective'] = effective;
    data['onset'] = onset;
    data['expires'] = expires;
    data['ends'] = ends;
    data['status'] = status;
    data['messageType'] = messageType;
    data['category'] = category;
    data['severity'] = severity;
    data['certainty'] = certainty;
    data['urgency'] = urgency;
    data['event'] = event;
    data['sender'] = sender;
    data['senderName'] = senderName;
    data['headline'] = headline;
    data['description'] = description;
    data['instruction'] = instruction;
    data['response'] = response;
    return data;
  }
}

class Geocode {
  List<String>? uGC;
  List<String>? sAME;

  Geocode({this.uGC, this.sAME});

  Geocode.fromJson(Map<String, dynamic> json) {
    uGC = json['UGC'].cast<String>();
    sAME = json['SAME'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UGC'] = uGC;
    data['SAME'] = sAME;
    return data;
  }
}

class References {
  String? id;
  String? identifier;
  String? sender;
  String? sent;

  References({this.id, this.identifier, this.sender, this.sent});

  References.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    identifier = json['identifier'];
    sender = json['sender'];
    sent = json['sent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@id'] = id;
    data['identifier'] = identifier;
    data['sender'] = sender;
    data['sent'] = sent;
    return data;
  }
}

class Pagination {
  String? next;

  Pagination({this.next});

  Pagination.fromJson(Map<String, dynamic> json) {
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next'] = next;
    return data;
  }
}
