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
        features!.add(new Features.fromJson(v));
      });
    }
    title = json['title'];
    updated = json['updated'];
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['updated'] = this.updated;
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
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
        json['geocode'] != null ? new Geocode.fromJson(json['geocode']) : null;
    affectedZones = json['affectedZones'].cast<String>();
    if (json['references'] != null) {
      references = <References>[];
      json['references'].forEach((v) {
        references!.add(new References.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['areaDesc'] = this.areaDesc;
    if (this.geocode != null) {
      data['geocode'] = this.geocode!.toJson();
    }
    data['affectedZones'] = this.affectedZones;
    if (this.references != null) {
      data['references'] = this.references!.map((v) => v.toJson()).toList();
    }
    data['sent'] = this.sent;
    data['effective'] = this.effective;
    data['onset'] = this.onset;
    data['expires'] = this.expires;
    data['ends'] = this.ends;
    data['status'] = this.status;
    data['messageType'] = this.messageType;
    data['category'] = this.category;
    data['severity'] = this.severity;
    data['certainty'] = this.certainty;
    data['urgency'] = this.urgency;
    data['event'] = this.event;
    data['sender'] = this.sender;
    data['senderName'] = this.senderName;
    data['headline'] = this.headline;
    data['description'] = this.description;
    data['instruction'] = this.instruction;
    data['response'] = this.response;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UGC'] = this.uGC;
    data['SAME'] = this.sAME;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    data['identifier'] = this.identifier;
    data['sender'] = this.sender;
    data['sent'] = this.sent;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    return data;
  }
}
