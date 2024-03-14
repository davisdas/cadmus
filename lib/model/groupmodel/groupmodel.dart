// To parse this JSON data, do
//
//     final groupModel = groupModelFromJson(jsonString);

import 'dart:convert';

GroupModel groupModelFromJson(String str) => GroupModel.fromJson(json.decode(str));

String groupModelToJson(GroupModel data) => json.encode(data.toJson());

class GroupModel {
    OwnerDetails? ownerDetails;
    List<EdGroup>? createdGroups;
    List<EdGroup>? addedGroups;

    GroupModel({
        this.ownerDetails,
        this.createdGroups,
        this.addedGroups,
    });

    factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        ownerDetails: json["owner_details"] == null ? null : OwnerDetails.fromJson(json["owner_details"]),
        createdGroups: json["created_groups"] == null ? [] : List<EdGroup>.from(json["created_groups"]!.map((x) => EdGroup.fromJson(x))),
        addedGroups: json["added_groups"] == null ? [] : List<EdGroup>.from(json["added_groups"]!.map((x) => EdGroup.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "owner_details": ownerDetails?.toJson(),
        "created_groups": createdGroups == null ? [] : List<dynamic>.from(createdGroups!.map((x) => x.toJson())),
        "added_groups": addedGroups == null ? [] : List<dynamic>.from(addedGroups!.map((x) => x.toJson())),
    };
}

class EdGroup {
    int? id;
    int? owner;
    String? groupName;
    String? groupImage;
    String? description;
    DateTime? createdAt;
    List<int>? members;

    EdGroup({
        this.id,
        this.owner,
        this.groupName,
        this.groupImage,
        this.description,
        this.createdAt,
        this.members,
    });

    factory EdGroup.fromJson(Map<String, dynamic> json) => EdGroup(
        id: json["id"],
        owner: json["owner"],
        groupName: json["group_name"],
        groupImage: json["group_image"],
        description: json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        members: json["members"] == null ? [] : List<int>.from(json["members"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "group_name": groupName,
        "group_image": groupImage,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "members": members == null ? [] : List<dynamic>.from(members!.map((x) => x)),
    };
}

class OwnerDetails {
    int? id;
    String? username;
    String? email;

    OwnerDetails({
        this.id,
        this.username,
        this.email,
    });

    factory OwnerDetails.fromJson(Map<String, dynamic> json) => OwnerDetails(
        id: json["id"],
        username: json["username"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
    };
}
