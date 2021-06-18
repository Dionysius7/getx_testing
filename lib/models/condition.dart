// To parse this JSON data, do
//
//     final conditionModel = conditionModelFromJson(jsonString);

import 'dart:convert';

List<ConditionModel> conditionModelFromJson(String str) => List<ConditionModel>.from(json.decode(str).map((x) => ConditionModel.fromJson(x)));

String conditionModelToJson(List<ConditionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConditionModel {
    ConditionModel({
        this.resourceType,
        this.category,
        this.code,
        this.subject,
        this.onSetDateTime,
        this.evidence,
        this.asserter,
        this.extension,
    });

    String? resourceType;
    Category? category;
    Category? code;
    Subject? subject;
    DateTime? onSetDateTime;
    Evidence? evidence;
    String? asserter;
    Extension? extension;

    factory ConditionModel.fromJson(Map<String, dynamic> json) => ConditionModel(
        resourceType: json["resourceType"],
        category: Category.fromJson(json["category"]),
        code: Category.fromJson(json["code"]),
        subject: Subject.fromJson(json["subject"]),
        onSetDateTime: DateTime.parse(json["onSetDateTime"]),
        evidence: Evidence.fromJson(json["evidence"]),
        asserter: json["asserter"],
        extension: Extension.fromJson(json["extension"]),
    );

    Map<String, dynamic> toJson() => {
        "resourceType": resourceType,
        "category": category!.toJson(),
        "code": code!.toJson(),
        "subject": subject!.toJson(),
        "onSetDateTime": onSetDateTime!.toIso8601String(),
        "evidence": evidence!.toJson(),
        "asserter": asserter,
        "extension": extension!.toJson(),
    };
}

class Category {
    Category({
        this.coding,
    });

    Coding? coding;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        coding: Coding.fromJson(json["coding"]),
    );

    Map<String, dynamic> toJson() => {
        "coding": coding!.toJson(),
    };
}

class Coding {
    Coding({
        this.system,
        this.display,
        this.code,
    });

    String? system;
    String? display;
    String? code;

    factory Coding.fromJson(Map<String, dynamic> json) => Coding(
        system: json["system"],
        display: json["display"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "system": system,
        "display": display,
        "code": code,
    };
}

class Evidence {
    Evidence({
        this.details,
    });

    String? details;

    factory Evidence.fromJson(Map<String, dynamic> json) => Evidence(
        details: json["details"],
    );

    Map<String, dynamic> toJson() => {
        "details": details,
    };
}

class Extension {
    Extension({
        this.url,
        this.valueString,
    });

    String? url;
    String? valueString;

    factory Extension.fromJson(Map<String, dynamic> json) => Extension(
        url: json["url"],
        valueString: json["valueString"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "valueString": valueString,
    };
}

class Subject {
    Subject({
        this.reference,
        this.identifier,
    });

    String? reference;
    String? identifier;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        reference: json["reference"],
        identifier: json["identifier"],
    );

    Map<String, dynamic> toJson() => {
        "reference": reference,
        "identifier": identifier,
    };
}
