// To parse this JSON data, do
//
//     final taskmodel = taskmodelFromJson(jsonString);

import 'dart:convert';

List<Taskmodel> taskmodelFromJson(String str) => List<Taskmodel>.from(json.decode(str).map((x) => Taskmodel.fromJson(x)));

String taskmodelToJson(List<Taskmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Taskmodel {
    int? id;
    String? title;
    String? description;
    DateTime? createdTime;
    DateTime? remindedDate;
    bool? status;
    int? owner;

    Taskmodel({
        this.id,
        this.title,
        this.description,
        this.createdTime,
        this.remindedDate,
        this.status,
        this.owner,
    });

    factory Taskmodel.fromJson(Map<String, dynamic> json) => Taskmodel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdTime: json["created_time"] == null ? null : DateTime.parse(json["created_time"]),
        remindedDate: json["reminded_date"] == null ? null : DateTime.parse(json["reminded_date"]),
        status: json["status"],
        owner: json["owner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "created_time": createdTime?.toIso8601String(),
        "reminded_date": remindedDate?.toIso8601String(),
        "status": status,
        "owner": owner,
    };
}
