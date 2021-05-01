// To parse this JSON data, do
//
//     final totalStatsModel = totalStatsModelFromJson(jsonString);

import 'dart:convert';

TotalStatsModel totalStatsModelFromJson(String str) =>
    TotalStatsModel.fromJson(json.decode(str));

String totalStatsModelToJson(TotalStatsModel data) =>
    json.encode(data.toJson());

class TotalStatsModel {
  TotalStatsModel({
    required this.success,
    required this.data,
    required this.lastRefreshed,
    required this.lastOriginUpdate,
  });

  final bool success;
  final Data data;
  final DateTime lastRefreshed;
  final DateTime lastOriginUpdate;

  factory TotalStatsModel.fromJson(Map<String, dynamic> json) =>
      TotalStatsModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        lastRefreshed: DateTime.parse(json["lastRefreshed"]),
        lastOriginUpdate: DateTime.parse(json["lastOriginUpdate"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "lastRefreshed": lastRefreshed.toIso8601String(),
        "lastOriginUpdate": lastOriginUpdate.toIso8601String(),
      };
}

class Data {
  Data({
    required this.summary,
    required this.unofficialSummary,
    required this.regional,
  });

  final Summary summary;
  final List<UnofficialSummary> unofficialSummary;
  final List<Regional> regional;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        summary: Summary.fromJson(json["summary"]),
        unofficialSummary: List<UnofficialSummary>.from(
            json["unofficial-summary"]
                .map((x) => UnofficialSummary.fromJson(x))),
        regional: List<Regional>.from(
            json["regional"].map((x) => Regional.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "summary": summary.toJson(),
        "unofficial-summary":
            List<dynamic>.from(unofficialSummary.map((x) => x.toJson())),
        "regional": List<dynamic>.from(regional.map((x) => x.toJson())),
      };
}

class Regional {
  Regional({
    required this.loc,
    required this.confirmedCasesIndian,
    required this.confirmedCasesForeign,
    required this.discharged,
    required this.deaths,
    required this.totalConfirmed,
  });

  final String loc;
  final int confirmedCasesIndian;
  final int confirmedCasesForeign;
  final int discharged;
  final int deaths;
  final int totalConfirmed;

  factory Regional.fromJson(Map<String, dynamic> json) => Regional(
        loc: json["loc"],
        confirmedCasesIndian: json["confirmedCasesIndian"],
        confirmedCasesForeign: json["confirmedCasesForeign"],
        discharged: json["discharged"],
        deaths: json["deaths"],
        totalConfirmed: json["totalConfirmed"],
      );

  Map<String, dynamic> toJson() => {
        "loc": loc,
        "confirmedCasesIndian": confirmedCasesIndian,
        "confirmedCasesForeign": confirmedCasesForeign,
        "discharged": discharged,
        "deaths": deaths,
        "totalConfirmed": totalConfirmed,
      };
}

class Summary {
  Summary({
    required this.total,
    required this.confirmedCasesIndian,
    required this.confirmedCasesForeign,
    required this.discharged,
    required this.deaths,
    required this.confirmedButLocationUnidentified,
  });

  final int total;
  final int confirmedCasesIndian;
  final int confirmedCasesForeign;
  final int discharged;
  final int deaths;
  final int confirmedButLocationUnidentified;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        total: json["total"],
        confirmedCasesIndian: json["confirmedCasesIndian"],
        confirmedCasesForeign: json["confirmedCasesForeign"],
        discharged: json["discharged"],
        deaths: json["deaths"],
        confirmedButLocationUnidentified:
            json["confirmedButLocationUnidentified"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "confirmedCasesIndian": confirmedCasesIndian,
        "confirmedCasesForeign": confirmedCasesForeign,
        "discharged": discharged,
        "deaths": deaths,
        "confirmedButLocationUnidentified": confirmedButLocationUnidentified,
      };
}

class UnofficialSummary {
  UnofficialSummary({
    required this.source,
    required this.total,
    required this.recovered,
    required this.deaths,
    required this.active,
  });

  final String source;
  final int total;
  final int recovered;
  final int deaths;
  final int active;

  factory UnofficialSummary.fromJson(Map<String, dynamic> json) =>
      UnofficialSummary(
        source: json["source"],
        total: json["total"],
        recovered: json["recovered"],
        deaths: json["deaths"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "total": total,
        "recovered": recovered,
        "deaths": deaths,
        "active": active,
      };
}
