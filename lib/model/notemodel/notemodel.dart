
import 'dart:convert';

List<Notemodel> notemodelFromJson(String str) => List<Notemodel>.from(json.decode(str).map((x) => Notemodel.fromJson(x)));

String notemodelToJson(List<Notemodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notemodel {
    int? id;
    String? title;
    String? content;
    String? categorizeNote;
    DateTime? createdAt;
    DateTime? updatedAt;
    bool? favorite;
    int? owner;

    Notemodel({
        this.id,
        this.title,
        this.content,
        this.categorizeNote,
        this.createdAt,
        this.updatedAt,
        this.favorite,
        this.owner,
    });

    factory Notemodel.fromJson(Map<String, dynamic> json) => Notemodel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        categorizeNote: json["categorize_note"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        favorite: json["favorite"],
        owner: json["owner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "categorize_note": categorizeNote,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "favorite": favorite,
        "owner": owner,
    };
}
